// Show a single table
import 'package:flutter/material.dart';
import 'package:sqlite_explorer/src/moor_bridge.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:tracers_package/tracers.dart';

import 'fsm_datasource.dart';
import 'structure_page.dart';

class TablePage extends StatefulWidget {
  final String sql;
  final String tableName;
  final MoorBridge moorBridge;
  final int rowsPerPage;

  TablePage({
    Key? key,
    required this.tableName,
    required this.moorBridge,
    required this.sql,
    this.rowsPerPage = 6,
  }) : super(key: key);

  _TablePageState createState() => _TablePageState(this.tableName);
}

class _TablePageState extends State<TablePage> {
  String tableName;
  _TablePageState(this.tableName);

  FSMDataSource _dataSource = FSMDataSource();

  List<DataColumn> _columns = [];

  @override
  void initState() {
    super.initState();
    _getData();
    _getColumns();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = ThemeColors(light: Colors.white, dark: Colors.grey).of(context: context);
    final dataColors = ThemeColors(light: Colors.black87, dark: Colors.white70).of(context: context);
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: SafeArea(
        child: Container(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          widget.moorBridge.delete(tableName: widget.tableName).then((value) {
                            _getData();
                          });
                        },
                        child: Text("Clear table", style: Theme.of(context).textTheme.button),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _getData();
                        },
                        child: Text("Refresh", style: Theme.of(context).textTheme.button),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return StructurePage(sql: widget.sql);
                          }));
                        },
                        child: Text("Structure", style: Theme.of(context).textTheme.button),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.purpleAccent, //Colors.transparent,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: _columns.isNotEmpty
                        ? ColorFiltered(
                            colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.colorBurn),
                            child: PaginatedDataTable(
                              rowsPerPage: widget.rowsPerPage,
                              columns: _columns,
                              header: Text(
                                widget.tableName,
                                style: TextStyle(color: dataColors),
                              ),
                              source: _dataSource,
                            ),
                          )
                        : Container(
                            color: Colors.yellow,
                          ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getData() {
    widget.moorBridge.query(widget.tableName, orderBy: 'rowid').then((rows) {
      if (rows.length > 0) {
        List<List<String>> list = [];

        rows.forEach((row) {
          list.add(row.values.map((value) => value.toString()).toList());
        });
        _dataSource.addData(list);
      } else {
        _dataSource.addData([]);
      }
      setState(() {});
    });
  }

  _getColumns() async {
    print(this.tableName);
    var rows = widget.moorBridge.rawQuery("select group_concat(name, '|') from pragma_table_info('${this.tableName}')");
    var cleanedRows = await rows;
    var columnsString = cleanedRows.toString().replaceAll("[{group_concat(name, '|'): ", "").replaceAll("}]", "");
    var column = columnsString.toString().split("|");
    final columnNameColor = Colors.yellowAccent;
    Log.T('columnNameColor ${columnNameColor.toString()}');
    _columns.addAll(column.map((key) {
      return DataColumn(
        label: Text(
          key.trimLeft().split(' ').first,
          style: TextStyle(color: columnNameColor),
        ),
      );
    }).toList());
  }
}

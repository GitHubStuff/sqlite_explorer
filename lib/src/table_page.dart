import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'structure_page.dart';

class TablePage extends StatefulWidget {
  final String sql;
  final String tableName;
  final Database database;
  final int rowsPerPage;

  TablePage({Key key, this.tableName, this.database, this.sql, this.rowsPerPage}) : super(key: key);

  _TablePageState createState() => _TablePageState(this.tableName);
}

class _TablePageState extends State<TablePage> {
  String tableName;
  _TablePageState(String tableName) {
    this.tableName = tableName;
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _getColumns();
  }

  FSMDataSource _dataSource = FSMDataSource();

  List<DataColumn> _columns = [];

  _getData() {
    widget.database.query(widget.tableName).then((rows) {
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
    var rows = widget.database.rawQuery("select group_concat(name, '|') from pragma_table_info('${this.tableName}')");
    var cleanedRows = await rows;
    var columnsString = cleanedRows.toString().replaceAll("[{group_concat(name, '|'): ", "").replaceAll("}]", "");
    var column = columnsString.toString().split("|");
    _columns.addAll(column.map((key) {
      return DataColumn(
          label: Text(
        key.trimLeft().split(' ').first,
        style: TextStyle(color: Colors.green),
      ));
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: SafeArea(
        child: Container(
          color: Colors.blueGrey, // modeView.color(context),
          child: Column(
            children: <Widget>[
              Container(
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: () {
                          widget.database.delete(widget.tableName).then((value) {
                            _getData();
                          });
                        },
                        child: Text("Clear table", style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: () {
                          _getData();
                        },
                        child: Text("Refresh", style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return StructurePage(sql: widget.sql);
                          }));
                        },
                        child: Text("Structure", style: Theme.of(context).textTheme.headline6),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green, //Colors.transparent,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: _columns.isNotEmpty
                        ? PaginatedDataTable(
                          rowsPerPage: widget.rowsPerPage,
                          columns: _columns,
                          header: Text(
                            widget.tableName,
                            style: TextStyle().copyWith(color: Colors.deepPurpleAccent),
                          ),
                          source: _dataSource,
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
}

class FSMDataSource extends DataTableSource {
  List<List<String>> _data = [];

  addData(List<List<String>> data) {
    _data.clear();
    _data.addAll(data);
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    return DataRow(
        cells: _data[index].map((cell) {
      return DataCell(
        Text(
          cell,
          style: TextStyle(color: Colors.purple),
        ),
      );
    }).toList());
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

// Show a single table
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extras/flutter_extras.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';
import 'package:sqlite_explorer/src/moor_bridge.dart';
import 'package:theme_manager/theme_manager.dart';

import 'constants.dart' as K;
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
    this.rowsPerPage = 8,
  }) : super(key: key);

  _TablePageState createState() => _TablePageState(this.tableName);
}

class _TablePageState extends ObservingStatefulWidget<TablePage> {
  String tableName;
  _TablePageState(this.tableName);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    debugPrint('BRIGHTNESS CHANGED');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      bloc: ThemeManager.themeCubit,
      builder: (_, state) {
        if (state is UpdateThemeMode) {
          final bloc = Modular.get<BuildCubit>();
          bloc.refresh();
        }
        return WillPopScope(
          onWillPop: () async {
            if (Navigator.of(context).userGestureInProgress)
              return false;
            else
              return true;
          },
          child: SafeArea(
            child: Container(
              color: K.color(K.safeAreaColor, context),
              child: Column(
                children: <Widget>[
                  /// 'Clear table', 'Refresh', 'Structure' buttons
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.moorBridge.clear(table: widget.tableName).then((value) {
                                _getData();
                              });
                            },
                            child: Text("Clear table", style: Theme.of(context).textTheme.button),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            child: Text("Refresh", style: Theme.of(context).textTheme.button),
                            onPressed: () {
                              final bloc = Modular.get<BuildCubit>();
                              bloc.refresh();
                            },
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

                  ///If the number doesn't reach full length of the widget, Expanded fills the gap
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: _displayDataWithHeaders(),
                      ),
                    ),
                  ),

                  /// Back/pop button
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _displayDataWithHeaders() {
    final bloc = Modular.get<BuildCubit>();
    return BlocBuilder<BuildCubit, BuildState>(
      bloc: bloc,
      builder: (context, state) {
        debugPrint('State: ${state.toString()}');
        if (state is BuildInitial) {
          Future.delayed(Duration(milliseconds: 500), () {
            _getData();
          });
          return CircularProgressIndicator(color: K.color(K.circularProgressColor, context));
        }
        if (state is BuildTable) {
          return state.columns.isNotEmpty
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    K.color(K.tableBackgroundColor, context),
                    BlendMode.colorBurn,
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: K.color(K.dividerColor, context),
                    ),
                    child: PaginatedDataTable(
                      rowsPerPage: widget.rowsPerPage,
                      columns: state.columns,
                      header: Text(
                        widget.tableName,
                        style: TextStyle(color: K.color(K.tableNameColor, context)),
                      ),
                      source: state.dataSource,
                    ),
                  ),
                )
              : Container(color: K.color(K.dividerColor, context));
        }
        return Text('Huh?');
      },
    );
  }

  _getData() {
    final sql = "SELECT * FROM ${widget.tableName} ORDER BY rowid";
    widget.moorBridge.rawSql(sql).then(
      (rows) {
        FSMDataSource _dataSource = FSMDataSource();
        if (rows.length > 0) {
          List<List<Widget>> list = [];
          rows.forEach((row) {
            list.add(row.values
                .map((value) => Text(
                      value.toString(),
                      style: TextStyle(
                        color: K.color(K.tableDataColor, context),
                      ),
                    ))
                .toList());
          });
          _dataSource.addData(list);
        } else {
          _dataSource.addData([]);
        }
        _getColumns(_dataSource);
      },
    );
  }

  _getColumns(FSMDataSource data) {
    widget.moorBridge.rawSql("select group_concat(name, '|') from pragma_table_info('${this.tableName}')").then(
      (rows) {
        var cleanedRows = rows;
        var columnsString = cleanedRows.toString().replaceAll("[{group_concat(name, '|'): ", "").replaceAll("}]", "");
        var column = columnsString.toString().split("|");
        final columnNameColor = ThemeColors(
          dark: Colors.yellowAccent,
          light: Colors.green[800]!,
        ).of(context: context);
        List<DataColumn> columnNames = [];
        columnNames.addAll(column.map((key) {
          return DataColumn(
            label: Text(
              key.trimLeft().split(' ').first,
              style: TextStyle(color: columnNameColor),
            ),
          );
        }).toList());

        final bloc = Modular.get<BuildCubit>();
        bloc.build(columnNames, data);
      },
    );
  }
}

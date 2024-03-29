// List of tables in the database
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_explorer/drift/drift_bridge.dart';
import 'package:theme_manager/theme_manager.dart';

import '../sqlite_explorer.dart';
import 'constants.dart' as K;
import 'raw_query_page.dart';
import 'table_item.dart';
import 'table_page.dart';

class TablesPage extends StatefulWidget {
  final DriftBridge driftBridge;
  final Function? onDatabaseDeleted;
  final int rowsPerPage;

  TablesPage({
    Key? key,
    required this.driftBridge,
    this.onDatabaseDeleted,
    required this.rowsPerPage,
  }) : super(key: key);

  _TablesPageState createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  final streamController = StreamController<List<TableItem>>();
  final Map<String, int> recordCounts = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 350), () {
      _getTables();
    });
  }

  /// Query 'sqlite_master' to retrieve information about all the tables
  /// in a database.
  ///
  /// 'sqlite_master' is a table that stores information about all the
  /// tables created in a database. It has the following schema:
  /// - type: TEXT
  /// - name: TEXT
  /// - tbl_name: TEXT
  /// - rootpage: INTEGER
  /// - sql: TEXT
  Future<void> _getTables() async {
    if (!widget.driftBridge.isOpen) return;
    var tablesRows = await widget.driftBridge.getTables();
    final List<TableItem> tables = tablesRows.map((table) => TableItem(table['name'] as String, table['sql'] as String)).toList();
    for (TableItem table in tables) {
      int count = (await widget.driftBridge.recordCount(tableName: table.name))!;
      recordCounts[table.name] = count;
    }

    streamController.sink.add(tables);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Container(
      color: K.color(K.tableListBackgroundColor, context),
      child: M.Column(
        children: <Widget>[
          Container(
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _getTables();
                    },
                    child: Text(
                      'Refresh',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    child: Text("Wipe database", style: Theme.of(context).textTheme.button),
                    onPressed: () {
                      var path = widget.driftBridge.path;
                      deleteDatabase(path).then((value) {
                        streamController.sink.add([]);
                        widget.driftBridge.close();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Modular.to.push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RawQueryPage(
                              driftBridge: widget.driftBridge,
                              rowsPerPage: widget.rowsPerPage, // leave room at botton
                            );
                          },
                        ),
                      );
                    },
                    child: Text("Query", style: Theme.of(context).textTheme.button),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TableItem>>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data!.map((table) {
                      final String recordCount = (recordCounts[table.name] ?? 0) == 0 ? 'none' : (recordCounts[table.name] ?? 0).toString();
                      return ListTile(
                        title: Text(table.name,
                            style: TextStyle(
                              color: K.color(K.defaultTextColor, context),
                              fontSize: TextKey.headline6.getFontSize,
                            )),
                        subtitle: Text('Records: $recordCount'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return TablePage(
                              tableName: table.name,
                              driftBridge: widget.driftBridge,
                              sql: table.sql,
                              rowsPerPage: widget.rowsPerPage,
                            );
                          }));
                        },
                        trailing: Icon(
                          Icons.art_track,
                          color: K.color(K.defaultTextColor, context),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}

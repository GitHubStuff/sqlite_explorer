// List of tables in the database
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as M;
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_explorer/src/moor_bridge.dart';

import '../sqlite_explorer.dart';
import 'constants.dart' as K;
import 'raw_query_page.dart';
import 'table_item.dart';
import 'table_page.dart';

class TablesPage extends StatefulWidget {
  final MoorBridge moorBridge;
  final Function? onDatabaseDeleted;
  final int rowsPerPage;

  TablesPage({
    Key? key,
    required this.moorBridge,
    this.onDatabaseDeleted,
    this.rowsPerPage = 10,
  }) : super(key: key);

  _TablesPageState createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  final _streamController = StreamController<List<TableItem>>();

  @override
  void initState() {
    super.initState();

    _getTables();
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
    if (widget.moorBridge.isOpen) {
      var tablesRows = await widget.moorBridge.getTables();
      final tables = tablesRows.map((table) => TableItem(table['name'] as String, table['sql'] as String)).toList();
      _streamController.sink.add(tables);
    } else {
      debugPrint("database closed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Container(
      color: modeView.of(context: context),
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
                      var path = widget.moorBridge.path;
                      deleteDatabase(path).then((value) {
                        _streamController.sink.add([]);
                        widget.moorBridge.close();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RawQueryPage(
                              moorBridge: widget.moorBridge,
                              rowsPerPage: K.rawRecordCount(context),
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
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data!.map((table) {
                      return ListTile(
                        title: Text(table.name, style: TextStyle(color: modeText.of(context: context))),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return TablePage(
                              tableName: table.name,
                              moorBridge: widget.moorBridge,
                              sql: table.sql,
                              rowsPerPage: widget.rowsPerPage,
                            );
                          }));
                        },
                        trailing: Icon(Icons.art_track, color: modeText.of(context: context)),
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
    _streamController.close();
    super.dispose();
  }
}

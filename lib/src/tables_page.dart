import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../sqlite_developer.dart';
import 'raw_query_page.dart';
import 'table_item.dart';
import 'table_page.dart';

class TablesPage extends StatefulWidget {
  final Database database;
  final Function onDatabaseDeleted;
  final int rowsPerPage;

  TablesPage({Key key, this.database, this.onDatabaseDeleted, this.rowsPerPage}) : super(key: key);

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
    if (widget.database.isOpen) {
      var tablesRows = await widget.database.query(
        'sqlite_master',
        where: 'type = ?',
        whereArgs: ['table'],
      );
      final tables = tablesRows.map((table) => TableItem(table['name'], table['sql'])).toList();
      _streamController.sink.add(tables);
    } else {
      debugPrint("database closed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: modeView.color(context),
        child: Column(
          children: <Widget>[
            Container(
                child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton(
                    onPressed: () {
                      _getTables();
                    },
                    child: Text("Refresh", style: Theme.of(context).textTheme.headline6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton(
                    onPressed: () {
                      var path = widget.database.path;
                      deleteDatabase(path).then((value) {
                        _streamController.sink.add([]);
                        widget.database.close();
                      });
                    },
                    child: Text("Delete database", style: Theme.of(context).textTheme.headline6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RawQueryPage(
                              database: widget.database,
                              rowsPerPage: widget.rowsPerPage,
                            );
                          },
                        ),
                      );
                    },
                    child: Text("Raw Query", style: Theme.of(context).textTheme.headline6),
                  ),
                ),
              ],
            )),
            Expanded(
              child: StreamBuilder<List<TableItem>>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data.map((table) {
                        return ListTile(
                          title: Text(table.name, style: TextStyle(color: modeText.color(context))),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return TablePage(
                                tableName: table.name,
                                database: widget.database,
                                sql: table.sql,
                                rowsPerPage: widget.rowsPerPage,
                              );
                            }));
                          },
                          trailing: Icon(Icons.art_track, color: modeText.color(context)),
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
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

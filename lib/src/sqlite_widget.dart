// NOTE: This widget should be used by SqliteScreenWidget and VERY VERY CAUTIOUSLY as child widget
// of anything else without a lot more testing

import 'package:flutter/material.dart';
import 'package:sqlite_explorer/src/moor_bridge.dart';
import 'package:theme_manager/theme_manager.dart';

import 'tables_page.dart';

class SqliteWidget extends StatefulWidget {
  /// If set false the widget is disabled and the icon is not displayed (e.g. in production).
  final bool enable;

  /// Contains the app itself
  final Widget child;

  /// Indicates the icon position of the manager
  final Alignment iconAlignment;

  /// To pass the app's database to the manager
  final MoorBridge database;

  /// Called when the database is deleted inside the manager
  final Function? onDatabaseDeleted;

  /// Set the number of rows visible per each page in order to avoid scrolling
  final int rowsPerPage;

  SqliteWidget({
    Key? key,
    required this.child,
    this.enable = true,
    this.iconAlignment = Alignment.bottomRight,
    required this.database,
    this.onDatabaseDeleted,
    this.rowsPerPage = 6,
  }) : super(key: key);

  _SqliteWidgetState createState() => _SqliteWidgetState();
}

class _SqliteWidgetState extends State<SqliteWidget> {
  bool _showContent = false;
  Color _modeColor = Colors.white;
  double _opacity = 0.0;
  final _buttonSize = 52.0;

  @override
  Widget build(BuildContext context) {
    /// The widget isn't enabled (aka production release) return the proper starting widget
    if (!widget.enable) return widget.child;
    final mode = ThemeManager.brightness(context);
    _modeColor = (mode == Brightness.light) ? Colors.white : Colors.grey;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          widget.child,
          Offstage(
            offstage: !_showContent,
            child: Navigator(
              initialRoute: 'root',
              onGenerateRoute: (settings) {
                if (settings.name == 'root') {
                  return MaterialPageRoute(builder: (context) {
                    return TablesPage(
                      moorBridge: widget.database,
                      onDatabaseDeleted: widget.onDatabaseDeleted,
                      rowsPerPage: widget.rowsPerPage,
                    );
                  });
                }
                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(2),
            alignment: widget.iconAlignment,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: _opacity,
                  child: ClipOval(
                    child: Material(
                      color: Colors.purple, // button color
                      child: InkWell(
                        splashColor: Colors.teal, // inkwell color
                        child: SizedBox(
                          width: _buttonSize,
                          height: _buttonSize,
                          child: Icon(
                            Icons.lightbulb_outline,
                            color: _modeColor,
                            size: 24.0,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            // ModeTheme.of(context).toggleBrightness();
                            // final mode = ModeTheme.of(context).brightness;
                            // _modeColor = (mode == Brightness.light) ? Colors.white : Colors.grey;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18),
                ClipOval(
                  child: Material(
                    color: Colors.purple, // button color
                    child: InkWell(
                      splashColor: Colors.teal, // inkwell color
                      child: SizedBox(
                          width: _buttonSize,
                          height: _buttonSize,
                          child: Icon(
                            Icons.storage,
                            color: Colors.white,
                            size: 24.0,
                          )),
                      onTap: () {
                        setState(() {
                          _showContent = !_showContent;
                          _opacity = (_showContent) ? 1.0 : 0.0;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

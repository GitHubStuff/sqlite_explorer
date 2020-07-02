/// Gateway widget to view SQLite databases
import 'package:flutter/material.dart';
import 'package:sqlite_controller/sqlite_controller.dart';
import 'sqlite_widget.dart';
import 'package:tracers/tracers.dart' as Log;

/// This is the default named for the routes defined in 'routes' of the MaterialApp, it can be overridden calling
/// SqliteScreenWidget.setRoute(newName).
const String _defaultRoute = '/dbScreen';

class SqliteScreenWidget extends StatefulWidget {
  /// To allow for Navigator to used named routes, the instance of this widget should include a route name to
  /// be used in place of 'static const route = '/className' that is defined when using snippet templates to
  /// create a StatefulWidget.
  /// This is done by creating private methods that set the route name when the widget is created.
  /// The call can provide one or _defaultRoute will be used.
  static get route => _route;
  static String _route = _defaultRoute;
  static setRoute(String routeName) {
    _route = routeName;
  }

  //--------------------------------------------------------------------------------------------------------------------------------
  /// This is the widget (the parent widget) that is passed so that normal flow can occur as well as display the Sqlite query
  /// operations for development
  final Widget childWidget;

  /// This widget is for development and in production should not be displayed, so this controls if the FAB at the bottom
  /// of the screen is visible(enabled) or not.
  final bool enabled;

  /// The number of rows the sqlite will display on queries, this is provided to help with screen layout information.
  final int rowsPerPage;

  /// Call to that defines the SQLite database instance (founding concept is a single Sqlite database file for each app)
  /// This is wrapper for info passed to create/open a sqlite database (name, version, create callback, update callback)
  /// found in the SQLite spec.
  final SQLiteIdentity sqliteIdentity;

  SqliteScreenWidget({
    Key key,
    @required this.childWidget,
    @required this.enabled,
    @required this.sqliteIdentity,
    this.rowsPerPage = 100,
    String route = _defaultRoute,
  })  : assert(childWidget != null),
        assert(enabled != null),
        assert(sqliteIdentity != null),
        assert(rowsPerPage != null && rowsPerPage > 4),
        super(key: key) {
    setRoute(route ?? _route);
    Log.t('sqlite_screen_widget.dart');
  }

  _SqliteScreenWidgetState createState() => _SqliteScreenWidgetState();
}

class _SqliteScreenWidgetState extends State<SqliteScreenWidget> {
  @override
  Widget build(BuildContext context) {
    /// Display the SQLiteWidget when the database has been opened/created and a spinner while the async task for opening/creating
    /// is going on.
    return FutureBuilder<Widget>(
      future: _getWidget(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else {
          return Container(alignment: Alignment.center, child: CircularProgressIndicator());
        }
      },
    );
  }

  /// This async tasks opens/creates/updates the sqlite database from the SQLiteIdentity class that was
  /// passed.
  Future<Widget> _getWidget() async {
    await SqliteController.initialize(
      name: widget.sqliteIdentity.databaseName,
      version: widget.sqliteIdentity.databaseVersion ?? 1,
      create: widget.sqliteIdentity.dbCreate,
      upgrade: widget.sqliteIdentity.dbUpgrade,
    );
    return SqliteWidget(
      database: SqliteController.database,
      enable: widget.enabled,
      child: widget.childWidget,
      iconAlignment: Alignment.bottomCenter,
      rowsPerPage: widget.rowsPerPage,
    );
  }
}

import 'package:after_layout/after_layout.dart';
import 'package:example_developer/json.dart';
import 'package:flutter/material.dart';
import 'package:hud_scaffold/hud_scaffold.dart';
import 'package:mode_theme/mode_theme.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import 'package:sqlite_explorer/sqlite_explorer.dart';
import 'package:tracers/tracers.dart' as Log;

import 'product_test/table_root/root.g.dart';

void main() => runApp(ZerkyApp());

class ZerkyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModeTheme(
      themeDataFunction: (Brightness brightness) => (brightness == Brightness.light) ? ModeTheme.light : ModeTheme.dark,
      defaultBrightness: Brightness.light,
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          home: SqliteScreenWidget(
            childWidget: Zerky(),
            moorBridge: SQL.SQLiteIdentity(databaseName: 'flutter_sqlite_developer.db'),
            enabled: true,
          ),
          initialRoute: '/',
          routes: {
            Zerky.route: (context) => ZerkyApp(),
            SqliteScreenWidget.route: (context) => SqliteScreenWidget(
                  childWidget: Zerky(),
                  moorBridge: SQL.SQLiteIdentity(databaseName: 'flutter_sqlite_developer.db'),
                  enabled: true,
                ),
          },
          theme: theme,
          title: 'ZerkyApp Demo',
        );
      },
    );
  }
}

class Zerky extends StatefulWidget {
  const Zerky({Key key}) : super(key: key);
  static const route = '/zerky';

  @override
  _Zerky createState() => _Zerky();
}

class _Zerky extends State<Zerky> with WidgetsBindingObserver, AfterLayoutMixin<Zerky> {
  bool hideSpinner = true;

  // ignore: non_constant_identifier_names
  Size get ScreenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Log.t('zerky initState()');
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Log.t('zerky afterFirstLayout()');
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    Log.t('zerky didChangeDependencies()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Log.t('zerky didChangeAppLifecycleState ${state.toString()}');
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    ModeTheme.of(context).setBrightness(brightness);
    Log.t('zerky didChangePlatformBrightness ${brightness.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    Log.t('zerky build()');
    return HudScaffold.progressText(
      context,
      hide: hideSpinner,
      indicatorColors: ModeColor(light: Colors.purpleAccent, dark: Colors.greenAccent),
      progressText: 'Creating database',
      scaffold: Scaffold(
        appBar: AppBar(
          title: Text('Title: zerky'),
        ),
        body: body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              hideSpinner = false;
              final m = jsonData();
              final root = Root.fromJson(m);
              root.createLink().then((result) {
                sqliteKey = result;
              });
              Log.t(m.toString());
              Future.delayed(Duration(seconds: 3), () {
                setState(() {
                  hideSpinner = true;
                });
              });
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    Log.t('zerky didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    Log.t('zerky deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    Log.t('zerky dispose()');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Scaffold body
  Widget body() {
    Log.t('zerky body()');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Zerky Template', style: Theme.of(context).textTheme.headline5),
          RaisedButton(
            child: Text('Toggle Mode', style: Theme.of(context).textTheme.headline5),
            onPressed: () {
              ModeTheme.of(context).toggleBrightness();
            },
          ),
          RaisedButton(
            child: Text('Next Screen', style: Theme.of(context).textTheme.headline5),
            onPressed: () {
              if (sqliteKey != null) {
                Root.readLink(sqlLink: sqliteKey).then((list) {
                  List<Root> zem = list;
                  print('${zem.toString()}');
                });
              } else {
                Log.f('Press the "+" to create a database');
              }

              /// Navigator.push(context, MaterialPageRoute(builder: (context) => Berky()));
            },
          ),
        ],
      ),
    );
  }
}

import 'package:sqlite_reporter/data/read_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extras/flutter_extras.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';
import 'package:theme_manager/theme_manager.dart';

class LoginWidget extends StatefulWidget {
  static final String route = '/LoginWidget';

  LoginWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends ObservingStatefulWidget<LoginWidget> {
  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ThemeControlWidget(),
        ],
      ),
      body: _quickBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: !_isFirst
            ? null
            : () {
                ReadJson().load();
                setState(() {
                  _isFirst = !_isFirst;
                });
              },
        tooltip: 'Increment',
        child: _isFirst ? Icon(Icons.add) : Icon(Icons.data_usage),
      ),
    );
  }

  Widget _quickBody(BuildContext context) {
    final moorBridge = Modular.get<MoorBridge>();
    return SqliteScreenWidget(childWidget: _body(), enabled: true, moorBridge: moorBridge);
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Login Spot'),
        ],
      ),
    );
  }
}

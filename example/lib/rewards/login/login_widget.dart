import 'package:flutter/material.dart';
import 'package:flutter_extras/flutter_extras.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';
import 'package:theme_manager/theme_manager.dart';

import '../../data/read_json.dart';

class LoginWidget extends StatefulWidget {
  static final String route = '/LoginWidget';

  final String title;
  LoginWidget({Key? key, required this.title}) : super(key: key);

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
      body: _quickBody(),
      floatingActionButton: FloatingActionButton(
        key: UniqueKey(),
        onPressed: () {
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

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tappling the "+" will add dummy records to the database, give it a try!',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickBody() {
    final driftBridge = Modular.get<DriftBridge>();
    return SqliteScreenWidget(
      key: UniqueKey(),
      parentWidget: _body(),
      enabled: true,
      driftBridge: driftBridge,
      rowsPerPage: 7,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_extras/flutter_extras.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_manager/theme_manager.dart';

import '../rewards/login/login_widget.dart';

class ScaffoldWidget extends StatefulWidget {
  ScaffoldWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldWidget createState() => _ScaffoldWidget();
}

class _ScaffoldWidget extends ObservingStatefulWidget<ScaffoldWidget> {
  String message = 'Tap for Size';
  String instruction = 'Tap the FAB to "Go To DATABASE!!!"';
  String instruction2 = 'Tap again';
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
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        key: UniqueKey(),
        onPressed: () {
          //Modular.to.navigate(LoginWidget.route);
          Modular.to.pushNamed(LoginWidget.route);
        },
        tooltip: 'map',
        child: Icon(Icons.map),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
          ),
          WidgetSize(
            onChange: (Size size) {
              setState(() {
                message = 'Size - $size';
              });
            },
            child: Text(
              _isFirst ? instruction : instruction2,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}

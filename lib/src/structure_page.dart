import 'package:flutter/material.dart';

import '../sqlite_developer.dart';

class StructurePage extends StatefulWidget {
  final String sql;

  StructurePage({Key key, this.sql}) : super(key: key);

  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {
    var parse = widget.sql.split("(")[1];
    parse = parse.split(")")[0];
    var columns = parse.split(",");

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: modeView.color(context),
            child: ListView(
              children: columns.map((column) {
                return ListTile(
                  title: Text(column.trimLeft(), style: TextStyle(color: modeText.color(context))),
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        )
      ],
    );
  }
}

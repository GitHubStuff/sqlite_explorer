import 'package:flutter/material.dart';

import '../sqlite_explorer.dart';

class StructurePage extends StatefulWidget {
  final String sql;

  StructurePage({Key? key, required this.sql}) : super(key: key);

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
        Container(
          child: Expanded(
            child: Card(
              color: modeView.of(context: context),
              child: ListView(
                children: columns.map((column) {
                  return ListTile(
                    title: Text(column.trimLeft(), style: TextStyle(color: modeText.of(context: context))),
                  );
                }).toList(),
              ),
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

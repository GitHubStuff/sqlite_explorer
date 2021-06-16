import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_manager/theme_manager.dart';

import '../sqlite_explorer.dart';
import 'constants.dart' as K;

class StructurePage extends StatefulWidget {
  final String sql;

  StructurePage({Key? key, required this.sql}) : super(key: key);

  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      bloc: ThemeManager.themeCubit,
      builder: (_, state) {
        if (state is UpdateThemeMode) {
          final bloc = Modular.get<BuildCubit>();
          bloc.refresh();
        }

        var parse = widget.sql.split("(")[1];
        parse = parse.split(")")[0];
        var columns = parse.split(",");

        return Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: Card(
                  color: K.color(K.tableBackgroundColor, context),
                  child: ListView(
                    children: columns.map((column) {
                      return ListTile(
                        title: Text(column.trimLeft(), style: TextStyle(color: K.color(K.tableDataColor, context))),
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
      },
    );
  }
}

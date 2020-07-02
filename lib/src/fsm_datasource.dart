import 'package:flutter/material.dart';
import 'package:mode_theme/mode_theme.dart';

class FSMDataSource extends DataTableSource {
  List<List<String>> _data = [];

  addData(List<List<String>> data) {
    _data.clear();
    _data.addAll(data);
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    Color dataColors = Colors.white70;

    return DataRow(
        cells: _data[index].map((cell) {
      return DataCell(
        Text(
          cell,
          style: TextStyle(color: dataColors),
        ),
      );
    }).toList());
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

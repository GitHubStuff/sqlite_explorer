import 'package:flutter/material.dart';
import 'package:sqlite_explorer/moor/moor_bridge.dart';
import 'package:theme_manager/theme_manager.dart';

import '../sqlite_explorer.dart';
import 'constants.dart' as K;

class RawQueryPage extends StatefulWidget {
  final MoorBridge moorBridge;
  //final Database db;
  final int rowsPerPage;

  const RawQueryPage({
    Key? key,
    required this.moorBridge,
    required this.rowsPerPage,
  }) : super(key: key);

  @override
  _RawQueryPage createState() => _RawQueryPage();
}

class _DBDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;
  final Color textColor;

  _DBDataTableSource(this._data, {required this.textColor});

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: _data[index].values.map((value) {
        return DataCell(Text(
          "$value",
          style: TextStyle(color: textColor),
        ));
      }).toList(),
    );
  }
}

class _RawQueryPage extends State<RawQueryPage> {
  final TextEditingController sqlQueryController = TextEditingController();
  List<Map<String, dynamic>>? _result;
  String _error = '';
  bool _isQueryRunning = false;

  @override
  Widget build(BuildContext context) {
    sqlQueryController.text = 'SELECT * FROM ';
    return Scaffold(
      //backgroundColor: modeView.of(context: context),
      appBar: AppBar(
        //backgroundColor: Colors.blueGrey, //modeView.of(context: context),
        title: Text('Raw Query'),
        actions: [
          ThemeControlWidget(),
        ],
        iconTheme: IconThemeData(color: K.color(K.modeColors, context)),
        elevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    sqlQueryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: sqlQueryController,
            decoration: InputDecoration(
              hintText: "SQL Query",
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: ThemeColors(
                  dark: Colors.grey,
                  light: Colors.green,
                ).of(context: context),
                width: 2,
              )),
            ),
          ),
          _buildCommandBar(),
          SizedBox(height: 4.0),
          Expanded(
            child: _buildResult(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommandBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            sqlQueryController.clear();
          },
          icon: Icon(
            Icons.close,
            color: K.color(K.defaultTextColor, context),
          ),
          label: Text(
            'Clear',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        ElevatedButton.icon(
          label: Text(
            'Run',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          onPressed: !this._isQueryRunning
              ? () {
                  // Hide keyboard
                  FocusScope.of(context).requestFocus(FocusNode());
                  _runQuery();
                }
              : null,
          icon: Icon(
            Icons.play_arrow,
            color: K.color(K.defaultTextColor, context),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    if (this._isQueryRunning) {
      return CircularProgressIndicator();
    }

    if (this._error.isNotEmpty) {
      return Text(
        _error,
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }

    if (this._result == null) {
      return Container();
    }

    if (this._result != null && this._result!.isEmpty) {
      return Text(
        "Success.\nResults: $_result",
        style: TextStyle(backgroundColor: K.color(K.tableDataColor, context)),
      );
    }

    return SingleChildScrollView(
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          K.color(K.tableBackgroundColor, context),
          BlendMode.colorBurn,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: K.color(K.dividerColor, context),
            iconTheme: IconThemeData().copyWith(color: K.color(K.iconColors, context)),
          ),
          child: PaginatedDataTable(
            columns: _result![0].keys.map((key) {
              return DataColumn(
                label: Text(
                  key,
                  style: TextStyle(color: K.color(K.tableHeaderColor, context)),
                ),
              );
            }).toList(),
            header: Text(
              'Result',
              style: TextStyle(color: K.color(K.tableNameColor, context)),
            ),
            source: _DBDataTableSource(_result!, textColor: K.color(K.tableDataColor, context)),
            rowsPerPage: this.widget.rowsPerPage,
          ),
        ),
      ),
    );
  }

  void _runQuery() async {
    String query = sqlQueryController.text;
    if (query.isEmpty) {
      return;
    }

    try {
      setState(() {
        _error = '';
        _isQueryRunning = true;
      });

      final result = await widget.moorBridge.rawSql(query);

      setState(() {
        _result = result;
        _isQueryRunning = false;
      });
    } catch (error) {
      setState(() {
        _error = "Invalid SQL Query! \n${error.toString()}";
        _isQueryRunning = false;
      });
    }
  }
}

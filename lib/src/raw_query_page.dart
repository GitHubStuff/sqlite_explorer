import 'package:flutter/material.dart';
import 'package:sqlite_explorer/src/moor_bridge.dart';
import 'package:theme_manager/theme_manager.dart';

import '../sqlite_explorer.dart';

class RawQueryPage extends StatefulWidget {
  final MoorBridge moorBridge;
  //final Database db;
  final int rowsPerPage;

  const RawQueryPage({
    Key? key,
    required this.moorBridge,
    this.rowsPerPage = 6,
  }) : super(key: key);

  @override
  _RawQueryPageState createState() => _RawQueryPageState();
}

class _RawQueryPageState extends State<RawQueryPage> {
  final TextEditingController _sqlQueryController = TextEditingController();
  List<Map<String, dynamic>>? _result;
  String _error = '';
  bool _isQueryRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sqlQueryController.dispose();
    super.dispose();
  }

  void _runQuery() async {
    String query = _sqlQueryController.text;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: modeView.of(context: context),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, //modeView.of(context: context),
        iconTheme: IconThemeData(color: modeView.of(context: context)),
        elevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _sqlQueryController,
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
          SizedBox(height: 16.0),
          Expanded(
            child: _buildResult(),
          ),
        ],
      ),
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
        style: TextStyle(backgroundColor: Colors.deepPurple),
      );
    }

    return SingleChildScrollView(
      child: PaginatedDataTable(
        columns: _result![0].keys.map((key) {
          return DataColumn(
            label: Text(
              key,
              style: TextStyle(color: Colors.deepPurple),
            ),
          );
        }).toList(),
        header: Text(
          'Result',
          style: TextStyle(color: Colors.red),
        ),
        source: _DBDataTableSource(_result!),
        rowsPerPage: this.widget.rowsPerPage,
      ),
    );
  }

  Widget _buildCommandBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            _sqlQueryController.clear();
          },
          icon: Icon(
            Icons.close,
            color: modeText.of(context: context),
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
          onPressed: !this._isQueryRunning
              ? () {
                  // Hide keyboard
                  FocusScope.of(context).requestFocus(FocusNode());
                  _runQuery();
                }
              : null,
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          label: Text(
            'Run',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _DBDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;

  _DBDataTableSource(this._data);

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: _data[index].values.map((value) {
        return DataCell(Text(
          "$value",
          style: TextStyle(color: Colors.purple),
        ));
      }).toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

late String _dbPath;

_setup(String name) {
  return () async {
    final dbFolder = await getApplicationDocumentsDirectory();
    _dbPath = p.join(dbFolder.path, name);
  };
}

class MoorBridge {
  final GeneratedDatabase generatedDatabase;

  MoorBridge({required final String dbName, required this.generatedDatabase}) {
    _setup(dbName);
  }

  bool get isOpen => true;

  String get path => _dbPath;

  void close() {}

  Future<void> delete({required String tableName}) async {}

  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final List<Map<String, Object>> result = [
      {'data': 1}
    ];
    return result;
  }

  Future<List<Map<String, Object?>>> rawQuery(String sql, [List<Object?>? arguments]) async {
    final List<Map<String, Object?>> result = [
      {'data': 1}
    ];
    return result;
  }
}

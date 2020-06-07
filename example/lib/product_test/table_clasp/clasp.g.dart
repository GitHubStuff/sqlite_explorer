/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 21:34(utc)

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import '../../product_test.g.dart';

///- Class declaration
class Clasp extends SQL.SQLParse<Clasp> {
  /// Class and Column keys
  static const String columnParentTableName = 'parentTableName';
  static const String columnParentRowid = 'parentRowid';
  static const String columnAlbum = 'album';
  static const String columnName = 'name';
  static const String columnWasAHit = 'wasAHit';

  ///- Property/Column declarations
  static bool _createTableIfNeeded = true; //Safety check to avoid repeatedly creating the Clasp table

  String _album;
  String get album => _album;
  setAlbum(String newValue) => _album = newValue;

  String _name;
  String get name => _name;
  setName(String newValue) => _name = newValue;

  int _wasAHit;
  bool get wasAHit => (_wasAHit == null) ? null : (_wasAHit == 1);
  setWasAHit(dynamic newValue) => _wasAHit = SQL.getBoolean(newValue) ? 1 : 0;

  ///- ToJson
  Map<String, dynamic> toJson() => {
        'album': album,
        'name': name,
        'wasAHit': wasAHit,
      };

  ///- ToCloud
  Map<String, dynamic> toCloud() => {
        'album': album,
        'name': name,
        'wasAHit': wasAHit,
      };

  ///- Static constructors
  static Clasp build(dynamic data) {
    if (data == null) return null;
    if (data is Map) return Clasp.fromJson(data);
    if (data is Clasp) return data;
    throw Exception('static ClaspBuild could not parse: ${data.toString()}');
  }

  ///- buildArray
  static List<Clasp> buildArray(List<dynamic> array) {
    List<Clasp> result = List();
    if (array == null) return result;
    if (array is List<Map<String, dynamic>>) {
      for (Map<String, dynamic> item in array) {
        result.add(Clasp.fromJson(item));
      }
      return result;
    }
    if (array is List<Clasp>) {
      for (Clasp item in array) {
        result.add(item);
      }
      return result;
    }
    throw Exception('Unknown datatype $array');
  }

  ///- Constructor
  Clasp({
    int parentRowid,
    String parentTableName,
    String album,
    String name,
    dynamic wasAHit,
  }) {
    this.parentRowid = parentRowid;
    this.parentTableName = parentTableName;
    setAlbum(album);
    setName(name);
    setWasAHit(wasAHit);
  }

  ///- Factory fromJson
  factory Clasp.fromJson(Map<String, dynamic> json) {
    var _instance = Clasp(
      parentRowid: json['parentRowid'] ?? 0,
      parentTableName: json['parentTableName'] ?? '',
      album: json['album'],
      name: json['name'],
      wasAHit: json['wasAHit'],
    );
    return _instance;
  }

  ///- Factory from Cloud
  factory Clasp.fromCloud(Map<String, dynamic> json) {
    var _instance = Clasp(
      album: json['album'],
      name: json['name'],
      wasAHit: json['wasAHit'],
    );
    return _instance;
  }

  ///- **************** BEGIN Sqlite C.R.U.D.  {Create, Read, Update, Delete}

  ///- SQLite Create
  Future<int> create({SQL.SQLiteLink link}) async {
    await createTable();
    this.parentRowid = link.rowid;
    this.parentTableName = link.tableName;
    final sql = '''INSERT INTO CLASP
     (
         parentRowid,
         parentTableName,
         album,
         name,
         wasAHit
     )
     VALUES
     (
         ${link.rowid},
         "${link.tableName}",
         "$_album",
         "$_name",
         $_wasAHit
     )''';

    int newRowid = await SQL.SqliteController.database.rawInsert(sql);
    this.rowid = newRowid;
    return this.rowid;
  }

  ///- SQLite Read
  static Future<List<Clasp>> read({SQL.SQLiteLink link, String whereClause, String orderBy = 'rowid'}) async {
    await createTable();
    final clause = whereClause ?? link.clause;
    String sql = 'SELECT rowid,* from CLASP';
    if (clause != null) sql += ' WHERE $clause';
    if (orderBy != null) sql += ' ORDER BY $orderBy';
    List<Map<String, dynamic>> maps = await SQL.SqliteController.database.rawQuery(sql).catchError((error, stack) {
      throw Exception(error.toString());
    });
    List<Clasp> results = List();
    for (Map<String, dynamic> map in maps) {
      final result = Clasp.fromJson(map);
      result.rowid = map['rowid'];
      results.add(result);
    }
    return results;
  }

  ///- SQLite Update Class
  Future<int> update({SQL.SQLiteLink link}) async {
    final clause = link.clause;
    await createTable();
    this.parentRowid = link.rowid;
    this.parentTableName = link.tableName;
    final sql = '''UPDATE CLASP
     SET
       parentRowid = $parentRowid,
       parentTableName = "$parentTableName",
       album = "$album",
       name = "$name",
       wasAHit = $wasAHit
     WHERE $clause''';

    return await SQL.SqliteController.database.rawUpdate(sql);
  }

  ///- Create Delete
  Future<int> delete({SQL.SQLiteLink link, String where}) async {
    await createTable();
    final clause = where ?? link?.clause;
    String sql = 'DELETE FROM CLASP ';
    if (where != null) sql = '$sql WHERE $clause';
    return await SQL.SqliteController.database.rawDelete(sql);
  }

  ///- **************** END Sqlite C.R.U.D.  {Create, Read, Update, Delete}
  ///- **************** BEGINS Sqlite C.R.U.D. for linked records

  ///- SQLCreate Creates Linked Records
  Future<SQL.SQLiteLink> createLink({SQL.SQLiteLink sqlLink}) async {
    sqlLink ??= SQL.SQLiteLink(tableName: 'Clasp');
    this.rowid = await create(link: sqlLink);
    final childLink = SQL.SQLiteLink(rowid: this.rowid, tableName: className);
    return childLink; //- Returning link to root/base object (aka "key" for future use)
  }

  ///- SQLRead Read all linked records
  static Future<List<Clasp>> readLink({SQL.SQLiteLink sqlLink, String whereClause}) async {
    if (sqlLink == null && whereClause == null) return null;
    final where = (sqlLink.tableName == 'Clasp') ? '(rowid = ${sqlLink.rowid})' : sqlLink.clause;
    List<Clasp> list = await read(whereClause: where);
    return list;
  }

  ///- SQLReadRoot Read all linked records based on root-key
  static Future<Clasp> readRoot({SQL.SQLiteLink sqlLink}) async {
    assert(sqlLink != null);
    String clause = '(rowid = ${sqlLink.rowid})';
    List<Clasp> list = await readLink(whereClause: clause);
    if (list == null || list.length != 1) throw SQLiteRecordNotFoundException('Cannot find record: $clause', 400);
    return list[0];
  }

  ///- SQLUpdate update all linked records
  Future<void> updateLink({SQL.SQLiteLink sqlLink}) async {
    await update(link: sqlLink);
    return null;
  }

  ///- SQLDelete delete all linked records
  Future<void> deleteLink({SQL.SQLiteLink sqlLink}) async {
    await delete(link: sqlLink);
    return null;
  }

  ///- **************** END Sqlite C.R.U.D. for linked records

  ///- **********
  ///- SQLite Create Table
  static Future<dynamic> createTable() async {
    if (!_createTableIfNeeded) return null;
    _createTableIfNeeded = false;
    final create = '''CREATE TABLE IF NOT EXISTS CLASP (
          parentRowid INTEGER DEFAULT 0,
          parentTableName TEXT DEFAULT '',
          album TEXT,
          name TEXT,
          wasAHit INTEGER
          )''';

    await SQL.SqliteController.database.execute(create);
    return null;
  }

  //- ******** Helpers
  //- Utility helpers

  ///- SQL Count of records
  ///- Return count of records in Clasp
  Future<int> count(String clause) async {
    await createTable();
    final whereClause = (clause == null) ? '' : 'WHERE $clause';
    final sql = 'SELECT COUNT("rowid") FROM Clasp $whereClause';
    return Sqflite.firstIntValue(await SQL.SqliteController.database.rawQuery(sql));
  }

  ///- SQL First record of query
  ///- Return first record of sql query
  Future<Clasp> firstRecord({String where, String orderBy = 'rowid asc limit 1'}) async {
    await createTable();
    if (orderBy == null) throw Exception('static first - orderBy string null');
    List<Clasp> results = await read(whereClause: where, orderBy: orderBy);
    return (results != null && results.length > 0) ? results[0] : null;
  }
}

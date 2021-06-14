/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 21:34(utc)

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import '../../product_test.g.dart';

///- Class declaration
class Writer extends SQL.SQLParse<Writer>{

   /// Class and Column keys
   static const String columnParentTableName = 'parentTableName';
   static const String columnParentRowid = 'parentRowid';
   static const String columnAgent = 'agent';
   static const String columnComposer = 'composer';

   ///- Property/Column declarations
   static bool _createTableIfNeeded = true;    //Safety check to avoid repeatedly creating the Writer table

   String _agent;
   String get agent => _agent;
   setAgent(String newValue) => _agent = newValue;

   String _composer;
   String get composer => _composer;
   setComposer(String newValue) => _composer = newValue;


   ///- ToJson
   Map<String, dynamic> toJson() => {
       'agent': agent,
       'composer': composer,
   };

   ///- ToCloud
   Map<String, dynamic> toCloud() => {
       'agent': agent,
       'composer': composer,
   };

///- Static constructors
  static Writer build(dynamic data) {
    if (data == null) return null;
    if (data is Map) return Writer.fromJson(data);
    if (data is Writer) return data;
    throw Exception('static WriterBuild could not parse: ${data.toString()}');
  }
  
  ///- buildArray
  static List<Writer> buildArray(List<dynamic> array) {
    List<Writer> result = List();
    if (array == null) return result;
    if (array is List<Map<String,dynamic>>) {
      for (Map<String,dynamic> item in array) {
         result.add(Writer.fromJson(item));
      }
      return result;
    }
    if (array is List<Writer>) {
      for (Writer item in array) {
         result.add(item);
      }
      return result;
    }
    throw Exception('Unknown datatype $array');
  }


   ///- Constructor
   Writer({
       int parentRowid,
       String parentTableName,
       String agent,
       String composer,
     }){
       this.parentRowid = parentRowid;
       this.parentTableName = parentTableName;
       setAgent(agent);
       setComposer(composer);
   }


   ///- Factory fromJson
   factory Writer.fromJson(Map<String, dynamic> json) { 
       var _instance = Writer(
         parentRowid : json['parentRowid'] ?? 0,
         parentTableName : json['parentTableName'] ?? '',
         agent : json['agent'],
         composer : json['composer'],
       );
       return _instance;
   }

   ///- Factory from Cloud
   factory Writer.fromCloud(Map<String, dynamic> json) { 
       var _instance = Writer(
         agent : json['agent'],
         composer : json['composer'],
       );
       return _instance;
   }
   ///- **************** BEGIN Sqlite C.R.U.D.  {Create, Read, Update, Delete}

   ///- SQLite Create 
   Future<int> create({SQL.SQLiteLink link}) async {
     await createTable();
     this.parentRowid = link.rowid;
     this.parentTableName = link.tableName;
     final sql = '''INSERT INTO WRITER
     (
         parentRowid,
         parentTableName,
         agent,
         composer
     )
     VALUES
     (
         ${link.rowid},
         "${link.tableName}",
         "$_agent",
         "$_composer"
     )''';

     int newRowid = await SQL.SqliteController.moorBridge.rawInsert(sql);
     this.rowid = newRowid;
     return this.rowid;
   }

   ///- SQLite Read
   static Future<List<Writer>> read({SQL.SQLiteLink link, String whereClause, String orderBy = 'rowid'}) async {
    await createTable();
    final clause = whereClause ?? link.clause;
    String sql = 'SELECT rowid,* from WRITER';
    if (clause != null) sql += ' WHERE $clause';
    if (orderBy != null) sql += ' ORDER BY $orderBy';
    List<Map<String,dynamic>> maps = await SQL.SqliteController.moorBridge.rawQuery(sql).catchError((error, stack) {
       throw Exception(error.toString());
    });
    List<Writer> results = List();
    for (Map<String,dynamic> map in maps) {
       final result = Writer.fromJson(map);
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
     final sql = '''UPDATE WRITER
     SET
       parentRowid = $parentRowid,
       parentTableName = "$parentTableName",
       agent = "$agent",
       composer = "$composer"
     WHERE $clause''';

     return await SQL.SqliteController.moorBridge.rawUpdate(sql);
   }

   ///- Create Delete
   Future<int> delete({SQL.SQLiteLink link, String where}) async {
      await createTable();
      final clause = where ?? link?.clause;
      String sql = 'DELETE FROM WRITER ';
      if (where != null) sql = '$sql WHERE $clause';
      return await SQL.SqliteController.moorBridge.rawDelete(sql);
   }
   ///- **************** END Sqlite C.R.U.D.  {Create, Read, Update, Delete}
   ///- **************** BEGINS Sqlite C.R.U.D. for linked records

   ///- SQLCreate Creates Linked Records
   Future<SQL.SQLiteLink> createLink({SQL.SQLiteLink sqlLink}) async {
      sqlLink ??= SQL.SQLiteLink(tableName: 'Writer');
      this.rowid = await create(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);
      return childLink;  //- Returning link to root/base object (aka "key" for future use)
   }

   ///- SQLRead Read all linked records
   static Future<List<Writer>> readLink({SQL.SQLiteLink sqlLink, String whereClause}) async {
      if (sqlLink == null && whereClause == null) return null;
      final where = (sqlLink.tableName == 'Writer') ? '(rowid = ${sqlLink.rowid})' : sqlLink.clause;
      List<Writer> list = await read(whereClause: where);
      return list;
   }

   ///- SQLReadRoot Read all linked records based on root-key
   static Future<Writer> readRoot({SQL.SQLiteLink sqlLink}) async {
      assert(sqlLink != null);
      String clause = '(rowid = ${sqlLink.rowid})';
      List<Writer> list = await readLink(whereClause: clause);
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
       final create = '''CREATE TABLE IF NOT EXISTS WRITER (
          parentRowid INTEGER DEFAULT 0,
          parentTableName TEXT DEFAULT '',
          agent TEXT,
          composer TEXT
          )''';

       await SQL.SqliteController.moorBridge.execute(create);
       return null;
   }

   //- ******** Helpers
   //- Utility helpers

   ///- SQL Count of records
   ///- Return count of records in Writer
  Future<int> count(String clause) async {
    await createTable();
    final whereClause = (clause == null) ? '' : 'WHERE $clause';
    final sql = 'SELECT COUNT("rowid") FROM Writer $whereClause';
    return Sqflite.firstIntValue(await SQL.SqliteController.moorBridge.rawQuery(sql));
  }

   ///- SQL First record of query
   ///- Return first record of sql query
  Future<Writer> firstRecord({String where, String orderBy = 'rowid asc limit 1'}) async {
    await createTable();
    if (orderBy == null) throw Exception('static first - orderBy string null');
    List<Writer> results = await read(whereClause: where, orderBy: orderBy);
    return (results != null && results.length > 0) ? results[0] : null;
  }
}

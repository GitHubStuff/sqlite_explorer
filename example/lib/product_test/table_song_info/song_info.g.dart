/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 21:34(utc)

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import '../../product_test.g.dart';

///- Class declaration
class SongInfo extends SQL.SQLParse<SongInfo>{

   /// Class and Column keys
   static const String columnParentTableName = 'parentTableName';
   static const String columnParentRowid = 'parentRowid';
   static const String columnQuantity = 'quantity';
   static const String columnYear = 'year';

   ///- Property/Column declarations
   static bool _createTableIfNeeded = true;    //Safety check to avoid repeatedly creating the SongInfo table

   int _quantity;
   int get quantity => _quantity;
   setQuantity(int newValue) => _quantity = newValue;

   String _year;
   DateTime get year => SQL.getDateTime(_year);
   setYear(dynamic newValue) => _year = SQL.dateString(newValue);


   ///- ToJson
   Map<String, dynamic> toJson() => {
       'quantity': quantity,
       'year': year,
   };

   ///- ToCloud
   Map<String, dynamic> toCloud() => {
       'quantity': quantity,
       'year': year,
   };

///- Static constructors
  static SongInfo build(dynamic data) {
    if (data == null) return null;
    if (data is Map) return SongInfo.fromJson(data);
    if (data is SongInfo) return data;
    throw Exception('static SongInfoBuild could not parse: ${data.toString()}');
  }
  
  ///- buildArray
  static List<SongInfo> buildArray(List<dynamic> array) {
    List<SongInfo> result = List();
    if (array == null) return result;
    if (array is List<Map<String,dynamic>>) {
      for (Map<String,dynamic> item in array) {
         result.add(SongInfo.fromJson(item));
      }
      return result;
    }
    if (array is List<SongInfo>) {
      for (SongInfo item in array) {
         result.add(item);
      }
      return result;
    }
    throw Exception('Unknown datatype $array');
  }


   ///- Constructor
   SongInfo({
       int parentRowid,
       String parentTableName,
       int quantity,
       dynamic year,
     }){
       this.parentRowid = parentRowid;
       this.parentTableName = parentTableName;
       setQuantity(quantity);
       setYear(year);
   }


   ///- Factory fromJson
   factory SongInfo.fromJson(Map<String, dynamic> json) { 
       var _instance = SongInfo(
         parentRowid : json['parentRowid'] ?? 0,
         parentTableName : json['parentTableName'] ?? '',
         quantity : json['quantity'],
         year : json['year'],
       );
       return _instance;
   }

   ///- Factory from Cloud
   factory SongInfo.fromCloud(Map<String, dynamic> json) { 
       var _instance = SongInfo(
         quantity : json['quantity'],
         year : json['year'],
       );
       return _instance;
   }
   ///- **************** BEGIN Sqlite C.R.U.D.  {Create, Read, Update, Delete}

   ///- SQLite Create 
   Future<int> create({SQL.SQLiteLink link}) async {
     await createTable();
     this.parentRowid = link.rowid;
     this.parentTableName = link.tableName;
     final sql = '''INSERT INTO SONGINFO
     (
         parentRowid,
         parentTableName,
         quantity,
         year
     )
     VALUES
     (
         ${link.rowid},
         "${link.tableName}",
         $_quantity,
         "$_year"
     )''';

     int newRowid = await SQL.SqliteController.moorBridge.rawInsert(sql);
     this.rowid = newRowid;
     return this.rowid;
   }

   ///- SQLite Read
   static Future<List<SongInfo>> read({SQL.SQLiteLink link, String whereClause, String orderBy = 'rowid'}) async {
    await createTable();
    final clause = whereClause ?? link.clause;
    String sql = 'SELECT rowid,* from SONGINFO';
    if (clause != null) sql += ' WHERE $clause';
    if (orderBy != null) sql += ' ORDER BY $orderBy';
    List<Map<String,dynamic>> maps = await SQL.SqliteController.moorBridge.rawQuery(sql).catchError((error, stack) {
       throw Exception(error.toString());
    });
    List<SongInfo> results = List();
    for (Map<String,dynamic> map in maps) {
       final result = SongInfo.fromJson(map);
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
     final sql = '''UPDATE SONGINFO
     SET
       parentRowid = $parentRowid,
       parentTableName = "$parentTableName",
       quantity = $quantity,
       year = "$year"
     WHERE $clause''';

     return await SQL.SqliteController.moorBridge.rawUpdate(sql);
   }

   ///- Create Delete
   Future<int> delete({SQL.SQLiteLink link, String where}) async {
      await createTable();
      final clause = where ?? link?.clause;
      String sql = 'DELETE FROM SONGINFO ';
      if (where != null) sql = '$sql WHERE $clause';
      return await SQL.SqliteController.moorBridge.rawDelete(sql);
   }
   ///- **************** END Sqlite C.R.U.D.  {Create, Read, Update, Delete}
   ///- **************** BEGINS Sqlite C.R.U.D. for linked records

   ///- SQLCreate Creates Linked Records
   Future<SQL.SQLiteLink> createLink({SQL.SQLiteLink sqlLink}) async {
      sqlLink ??= SQL.SQLiteLink(tableName: 'SongInfo');
      this.rowid = await create(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);
      return childLink;  //- Returning link to root/base object (aka "key" for future use)
   }

   ///- SQLRead Read all linked records
   static Future<List<SongInfo>> readLink({SQL.SQLiteLink sqlLink, String whereClause}) async {
      if (sqlLink == null && whereClause == null) return null;
      final where = (sqlLink.tableName == 'SongInfo') ? '(rowid = ${sqlLink.rowid})' : sqlLink.clause;
      List<SongInfo> list = await read(whereClause: where);
      return list;
   }

   ///- SQLReadRoot Read all linked records based on root-key
   static Future<SongInfo> readRoot({SQL.SQLiteLink sqlLink}) async {
      assert(sqlLink != null);
      String clause = '(rowid = ${sqlLink.rowid})';
      List<SongInfo> list = await readLink(whereClause: clause);
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
       final create = '''CREATE TABLE IF NOT EXISTS SONGINFO (
          parentRowid INTEGER DEFAULT 0,
          parentTableName TEXT DEFAULT '',
          quantity INTEGER,
          year TEXT
          )''';

       await SQL.SqliteController.moorBridge.execute(create);
       return null;
   }

   //- ******** Helpers
   //- Utility helpers

   ///- SQL Count of records
   ///- Return count of records in SongInfo
  Future<int> count(String clause) async {
    await createTable();
    final whereClause = (clause == null) ? '' : 'WHERE $clause';
    final sql = 'SELECT COUNT("rowid") FROM SongInfo $whereClause';
    return Sqflite.firstIntValue(await SQL.SqliteController.moorBridge.rawQuery(sql));
  }

   ///- SQL First record of query
   ///- Return first record of sql query
  Future<SongInfo> firstRecord({String where, String orderBy = 'rowid asc limit 1'}) async {
    await createTable();
    if (orderBy == null) throw Exception('static first - orderBy string null');
    List<SongInfo> results = await read(whereClause: where, orderBy: orderBy);
    return (results != null && results.length > 0) ? results[0] : null;
  }
}

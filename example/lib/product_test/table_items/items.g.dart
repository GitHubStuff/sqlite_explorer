/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 21:34(utc)

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import '../../product_test.g.dart';

import '../table_song_info/song_info.g.dart';
import '../table_writer/writer.g.dart';


///- Class declaration
class Items extends SQL.SQLParse<Items>{

   /// Class and Column keys
   static const String columnParentTableName = 'parentTableName';
   static const String columnParentRowid = 'parentRowid';
   static const String columnSongLength = 'songLength';
   static const String columnSongRelease = 'songRelease';
   static const String columnSongTitle = 'songTitle';
   static const String columnSongWriter = 'songWriter';

   ///- Property/Column declarations
   static bool _createTableIfNeeded = true;    //Safety check to avoid repeatedly creating the Items table

   int _songLength;
   int get songLength => _songLength;
   setSongLength(int newValue) => _songLength = newValue;

   List<SongInfo> _songRelease;
   List<SongInfo> get songRelease => _songRelease;
   setSongRelease(List<Map<String, dynamic>> newValue) => _songRelease = SongInfo.buildArray(newValue);

   String _songTitle;
   String get songTitle => _songTitle;
   setSongTitle(String newValue) => _songTitle = newValue;

   Writer _songWriter;
   Writer get songWriter => _songWriter;
   setSongWriter(dynamic newValue) => _songWriter = Writer.build(newValue);


   ///- ToJson
   Map<String, dynamic> toJson() => {
       'songLength': songLength,
       'songRelease': jsonArray<SongInfo>(songRelease),
       'songTitle': songTitle,
       'songWriter': songWriter.toJson(),
   };

   ///- ToCloud
   Map<String, dynamic> toCloud() => {
       'songLength': songLength,
       'songRelease': jsonArray<SongInfo>(songRelease),
       'songTitle': songTitle,
       'songWriter': songWriter.toJson(),
   };

///- Static constructors
  static Items build(dynamic data) {
    if (data == null) return null;
    if (data is Map) return Items.fromJson(data);
    if (data is Items) return data;
    throw Exception('static ItemsBuild could not parse: ${data.toString()}');
  }
  
  ///- buildArray
  static List<Items> buildArray(List<dynamic> array) {
    List<Items> result = List();
    if (array == null) return result;
    if (array is List<Map<String,dynamic>>) {
      for (Map<String,dynamic> item in array) {
         result.add(Items.fromJson(item));
      }
      return result;
    }
    if (array is List<Items>) {
      for (Items item in array) {
         result.add(item);
      }
      return result;
    }
    throw Exception('Unknown datatype $array');
  }


   ///- Constructor
   Items({
       int parentRowid,
       String parentTableName,
       int songLength,
       List<Map<String,dynamic>> songRelease,
       String songTitle,
       dynamic songWriter,
     }){
       this.parentRowid = parentRowid;
       this.parentTableName = parentTableName;
       setSongLength(songLength);
       setSongRelease(songRelease);
       setSongTitle(songTitle);
       setSongWriter(songWriter);
   }


   ///- Factory fromJson
   factory Items.fromJson(Map<String, dynamic> json) { 
       var _instance = Items(
         parentRowid : json['parentRowid'] ?? 0,
         parentTableName : json['parentTableName'] ?? '',
         songLength : json['songLength'],
         songRelease : json['songRelease']?.cast<Map<String,dynamic>>(),
         songTitle : json['songTitle'],
         songWriter : json['songWriter'],
       );
       return _instance;
   }

   ///- Factory from Cloud
   factory Items.fromCloud(Map<String, dynamic> json) { 
       var _instance = Items(
         songLength : json['songLength'],
         songRelease : json['songRelease'],
         songTitle : json['songTitle'],
         songWriter : json['songWriter'],
       );
       return _instance;
   }
   ///- **************** BEGIN Sqlite C.R.U.D.  {Create, Read, Update, Delete}

   ///- SQLite Create 
   Future<int> create({SQL.SQLiteLink link}) async {
     await createTable();
     this.parentRowid = link.rowid;
     this.parentTableName = link.tableName;
     final sql = '''INSERT INTO ITEMS
     (
         parentRowid,
         parentTableName,
         songLength,
         songTitle
     )
     VALUES
     (
         ${link.rowid},
         "${link.tableName}",
         $_songLength,
         "$_songTitle"
     )''';

     int newRowid = await SQL.SqliteController.moorBridge.rawInsert(sql);
     this.rowid = newRowid;
     return this.rowid;
   }

   ///- SQLite Read
   static Future<List<Items>> read({SQL.SQLiteLink link, String whereClause, String orderBy = 'rowid'}) async {
    await createTable();
    final clause = whereClause ?? link.clause;
    String sql = 'SELECT rowid,* from ITEMS';
    if (clause != null) sql += ' WHERE $clause';
    if (orderBy != null) sql += ' ORDER BY $orderBy';
    List<Map<String,dynamic>> maps = await SQL.SqliteController.moorBridge.rawQuery(sql).catchError((error, stack) {
       throw Exception(error.toString());
    });
    List<Items> results = List();
    for (Map<String,dynamic> map in maps) {
       final result = Items.fromJson(map);
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
     final sql = '''UPDATE ITEMS
     SET
       parentRowid = $parentRowid,
       parentTableName = "$parentTableName",
       songLength = $songLength,
       songTitle = "$songTitle"
     WHERE $clause''';

     return await SQL.SqliteController.moorBridge.rawUpdate(sql);
   }

   ///- Create Delete
   Future<int> delete({SQL.SQLiteLink link, String where}) async {
      await createTable();
      final clause = where ?? link?.clause;
      String sql = 'DELETE FROM ITEMS ';
      if (where != null) sql = '$sql WHERE $clause';
      return await SQL.SqliteController.moorBridge.rawDelete(sql);
   }
   ///- **************** END Sqlite C.R.U.D.  {Create, Read, Update, Delete}
   ///- **************** BEGINS Sqlite C.R.U.D. for linked records

   ///- SQLCreate Creates Linked Records
   Future<SQL.SQLiteLink> createLink({SQL.SQLiteLink sqlLink}) async {
      sqlLink ??= SQL.SQLiteLink(tableName: 'Items');
      this.rowid = await create(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);
      songRelease.forEach((rec) async => await rec.createLink(sqlLink: childLink));

      await songWriter.createLink(sqlLink: childLink);

      return childLink;  //- Returning link to root/base object (aka "key" for future use)
   }

   ///- SQLRead Read all linked records
   static Future<List<Items>> readLink({SQL.SQLiteLink sqlLink, String whereClause}) async {
      if (sqlLink == null && whereClause == null) return null;
      final where = (sqlLink.tableName == 'Items') ? '(rowid = ${sqlLink.rowid})' : sqlLink.clause;
      List<Items> list = await read(whereClause: where);
      for (Items item in list) {
         final SQL.SQLiteLink newLink = SQL.SQLiteLink(rowid: item.rowid, tableName: item.className);
         item._songRelease = await SongInfo.readLink(sqlLink: newLink);

         /// Since read returns a List<>, only the first element is used (should be only one)
         List<Writer> _writer = await Writer.readLink(sqlLink: newLink);
         if (_writer == null || _writer.length > 1) throw Exception('Missing data for Writer');
         item._songWriter = _writer[0];

      }
      return list;
   }

   ///- SQLReadRoot Read all linked records based on root-key
   static Future<Items> readRoot({SQL.SQLiteLink sqlLink}) async {
      assert(sqlLink != null);
      String clause = '(rowid = ${sqlLink.rowid})';
      List<Items> list = await readLink(whereClause: clause);
      if (list == null || list.length != 1) throw SQLiteRecordNotFoundException('Cannot find record: $clause', 400);
      return list[0];
   }

   ///- SQLUpdate update all linked records
   Future<void> updateLink({SQL.SQLiteLink sqlLink}) async {
      await update(link: sqlLink);
         final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: this.className);
         songRelease.forEach((rec) async => await rec.updateLink(sqlLink: childLink));

         await songWriter.updateLink(sqlLink: childLink);

      return null;
   }

   ///- SQLDelete delete all linked records
   Future<void> deleteLink({SQL.SQLiteLink sqlLink}) async {
      await delete(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);

      songRelease.forEach((rec) async => await rec.deleteLink(sqlLink: childLink));

      await songWriter.deleteLink(sqlLink: childLink);
      return null;
   }
   ///- **************** END Sqlite C.R.U.D. for linked records

   ///- **********
   ///- SQLite Create Table
   static Future<dynamic> createTable() async {
       if (!_createTableIfNeeded) return null;
       _createTableIfNeeded = false;
       final create = '''CREATE TABLE IF NOT EXISTS ITEMS (
          parentRowid INTEGER DEFAULT 0,
          parentTableName TEXT DEFAULT '',
          songLength INTEGER,
          songTitle TEXT
          )''';

       await SQL.SqliteController.moorBridge.execute(create);
       return null;
   }

   //- ******** Helpers
   //- Utility helpers

   ///- SQL Count of records
   ///- Return count of records in Items
  Future<int> count(String clause) async {
    await createTable();
    final whereClause = (clause == null) ? '' : 'WHERE $clause';
    final sql = 'SELECT COUNT("rowid") FROM Items $whereClause';
    return Sqflite.firstIntValue(await SQL.SqliteController.moorBridge.rawQuery(sql));
  }

   ///- SQL First record of query
   ///- Return first record of sql query
  Future<Items> firstRecord({String where, String orderBy = 'rowid asc limit 1'}) async {
    await createTable();
    if (orderBy == null) throw Exception('static first - orderBy string null');
    List<Items> results = await read(whereClause: where, orderBy: orderBy);
    return (results != null && results.length > 0) ? results[0] : null;
  }
}

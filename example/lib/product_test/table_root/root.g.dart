/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 21:34(utc)

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_controller/sqlite_controller.dart' as SQL;
import '../../product_test.g.dart';

import '../table_clasp/clasp.g.dart';
import '../table_items/items.g.dart';


///- Class declaration
class Root extends SQL.SQLParse<Root>{

   /// Class and Column keys
   static const String columnParentTableName = 'parentTableName';
   static const String columnParentRowid = 'parentRowid';
   static const String columnAge = 'age';
   static const String columnClasp = 'clasp';
   static const String columnItems = 'items';

   ///- Property/Column declarations
   static bool _createTableIfNeeded = true;    //Safety check to avoid repeatedly creating the Root table

   int _age;
   int get age => _age;
   setAge(int newValue) => _age = newValue;

   Clasp _clasp;
   Clasp get clasp => _clasp;
   setClasp(dynamic newValue) => _clasp = Clasp.build(newValue);

   Items _items;
   Items get items => _items;
   setItems(dynamic newValue) => _items = Items.build(newValue);


   ///- ToJson
   Map<String, dynamic> toJson() => {
       'age': age,
       'clasp': clasp.toJson(),
       'items': items.toJson(),
   };

   ///- ToCloud
   Map<String, dynamic> toCloud() => {
       'age': age,
       'clasp': clasp.toJson(),
       'items': items.toJson(),
   };

///- Static constructors
  static Root build(dynamic data) {
    if (data == null) return null;
    if (data is Map) return Root.fromJson(data);
    if (data is Root) return data;
    throw Exception('static RootBuild could not parse: ${data.toString()}');
  }
  
  ///- buildArray
  static List<Root> buildArray(List<dynamic> array) {
    List<Root> result = List();
    if (array == null) return result;
    if (array is List<Map<String,dynamic>>) {
      for (Map<String,dynamic> item in array) {
         result.add(Root.fromJson(item));
      }
      return result;
    }
    if (array is List<Root>) {
      for (Root item in array) {
         result.add(item);
      }
      return result;
    }
    throw Exception('Unknown datatype $array');
  }


   ///- Constructor
   Root({
       int parentRowid,
       String parentTableName,
       int age,
       dynamic clasp,
       dynamic items,
     }){
       this.parentRowid = parentRowid;
       this.parentTableName = parentTableName;
       setAge(age);
       setClasp(clasp);
       setItems(items);
   }


   ///- Factory fromJson
   factory Root.fromJson(Map<String, dynamic> json) { 
       var _instance = Root(
         parentRowid : json['parentRowid'] ?? 0,
         parentTableName : json['parentTableName'] ?? '',
         age : json['age'],
         clasp : json['clasp'],
         items : json['items'],
       );
       return _instance;
   }

   ///- Factory from Cloud
   factory Root.fromCloud(Map<String, dynamic> json) { 
       var _instance = Root(
         age : json['age'],
         clasp : json['clasp'],
         items : json['items'],
       );
       return _instance;
   }
   ///- **************** BEGIN Sqlite C.R.U.D.  {Create, Read, Update, Delete}

   ///- SQLite Create 
   Future<int> create({SQL.SQLiteLink link}) async {
     await createTable();
     this.parentRowid = link.rowid;
     this.parentTableName = link.tableName;
     final sql = '''INSERT INTO ROOT
     (
         parentRowid,
         parentTableName,
         age
     )
     VALUES
     (
         ${link.rowid},
         "${link.tableName}",
         $_age
     )''';

     int newRowid = await SQL.SqliteController.moorBridge.rawInsert(sql);
     this.rowid = newRowid;
     return this.rowid;
   }

   ///- SQLite Read
   static Future<List<Root>> read({SQL.SQLiteLink link, String whereClause, String orderBy = 'rowid'}) async {
    await createTable();
    final clause = whereClause ?? link.clause;
    String sql = 'SELECT rowid,* from ROOT';
    if (clause != null) sql += ' WHERE $clause';
    if (orderBy != null) sql += ' ORDER BY $orderBy';
    List<Map<String,dynamic>> maps = await SQL.SqliteController.moorBridge.rawQuery(sql).catchError((error, stack) {
       throw Exception(error.toString());
    });
    List<Root> results = List();
    for (Map<String,dynamic> map in maps) {
       final result = Root.fromJson(map);
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
     final sql = '''UPDATE ROOT
     SET
       parentRowid = $parentRowid,
       parentTableName = "$parentTableName",
       age = $age
     WHERE $clause''';

     return await SQL.SqliteController.moorBridge.rawUpdate(sql);
   }

   ///- Create Delete
   Future<int> delete({SQL.SQLiteLink link, String where}) async {
      await createTable();
      final clause = where ?? link?.clause;
      String sql = 'DELETE FROM ROOT ';
      if (where != null) sql = '$sql WHERE $clause';
      return await SQL.SqliteController.moorBridge.rawDelete(sql);
   }
   ///- **************** END Sqlite C.R.U.D.  {Create, Read, Update, Delete}
   ///- **************** BEGINS Sqlite C.R.U.D. for linked records

   ///- SQLCreate Creates Linked Records
   Future<SQL.SQLiteLink> createLink({SQL.SQLiteLink sqlLink}) async {
      sqlLink ??= SQL.SQLiteLink(tableName: 'Root');
      this.rowid = await create(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);
      await clasp.createLink(sqlLink: childLink);

      await items.createLink(sqlLink: childLink);

      return childLink;  //- Returning link to root/base object (aka "key" for future use)
   }

   ///- SQLRead Read all linked records
   static Future<List<Root>> readLink({SQL.SQLiteLink sqlLink, String whereClause}) async {
      if (sqlLink == null && whereClause == null) return null;
      final where = (sqlLink.tableName == 'Root') ? '(rowid = ${sqlLink.rowid})' : sqlLink.clause;
      List<Root> list = await read(whereClause: where);
      for (Root item in list) {
         final SQL.SQLiteLink newLink = SQL.SQLiteLink(rowid: item.rowid, tableName: item.className);
         /// Since read returns a List<>, only the first element is used (should be only one)
         List<Clasp> _clasp = await Clasp.readLink(sqlLink: newLink);
         if (_clasp == null || _clasp.length > 1) throw Exception('Missing data for Clasp');
         item._clasp = _clasp[0];

         /// Since read returns a List<>, only the first element is used (should be only one)
         List<Items> _items = await Items.readLink(sqlLink: newLink);
         if (_items == null || _items.length > 1) throw Exception('Missing data for Items');
         item._items = _items[0];

      }
      return list;
   }

   ///- SQLReadRoot Read all linked records based on root-key
   static Future<Root> readRoot({SQL.SQLiteLink sqlLink}) async {
      assert(sqlLink != null);
      String clause = '(rowid = ${sqlLink.rowid})';
      List<Root> list = await readLink(whereClause: clause);
      if (list == null || list.length != 1) throw SQLiteRecordNotFoundException('Cannot find record: $clause', 400);
      return list[0];
   }

   ///- SQLUpdate update all linked records
   Future<void> updateLink({SQL.SQLiteLink sqlLink}) async {
      await update(link: sqlLink);
         final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: this.className);
         await clasp.updateLink(sqlLink: childLink);

         await items.updateLink(sqlLink: childLink);

      return null;
   }

   ///- SQLDelete delete all linked records
   Future<void> deleteLink({SQL.SQLiteLink sqlLink}) async {
      await delete(link: sqlLink);
      final childLink = SQL.SQLiteLink(rowid:this.rowid, tableName: className);

      await clasp.deleteLink(sqlLink: childLink);

      await items.deleteLink(sqlLink: childLink);
      return null;
   }
   ///- **************** END Sqlite C.R.U.D. for linked records

   ///- **********
   ///- SQLite Create Table
   static Future<dynamic> createTable() async {
       if (!_createTableIfNeeded) return null;
       _createTableIfNeeded = false;
       final create = '''CREATE TABLE IF NOT EXISTS ROOT (
          parentRowid INTEGER DEFAULT 0,
          parentTableName TEXT DEFAULT '',
          age INTEGER
          )''';

       await SQL.SqliteController.moorBridge.execute(create);
       return null;
   }

   //- ******** Helpers
   //- Utility helpers

   ///- SQL Count of records
   ///- Return count of records in Root
  Future<int> count(String clause) async {
    await createTable();
    final whereClause = (clause == null) ? '' : 'WHERE $clause';
    final sql = 'SELECT COUNT("rowid") FROM Root $whereClause';
    return Sqflite.firstIntValue(await SQL.SqliteController.moorBridge.rawQuery(sql));
  }

   ///- SQL First record of query
   ///- Return first record of sql query
  Future<Root> firstRecord({String where, String orderBy = 'rowid asc limit 1'}) async {
    await createTable();
    if (orderBy == null) throw Exception('static first - orderBy string null');
    List<Root> results = await read(whereClause: where, orderBy: orderBy);
    return (results != null && results.length > 0) ? results[0] : null;
  }
}

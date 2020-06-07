/// AUTO-GENERATED CODE - DO NOT MODIFY IF POSSIBLE
/// Created: February 13,2020 20:21(utc)

library sqlite_product_test_library;

import 'package:app_exception/appexception.dart';

export 'product_test/table_clasp/clasp.g.dart';
export 'product_test/table_items/items.g.dart';
export 'product_test/table_root/root.g.dart';
export 'product_test/table_song_info/song_info.g.dart';
export 'product_test/table_writer/writer.g.dart';

///- Constants to refer to table name
const String tableClasp = 'Clasp';
const String tableItems = 'Items';
const String tableRoot = 'Root';
const String tableSongInfo = 'SongInfo';
const String tableWriter = 'Writer';

///- Helper: Collection of all table names in the project
final List<String> listOfTables = [
  'Clasp',
  'Items',
  'Root',
  'SongInfo',
  'Writer',
];

class BadLinkException extends AppException {
  BadLinkException([message, int code]) : super(message, 'Bad SQLiteLink', code);
}

class SQLiteRecordNotFoundException extends AppException {
  SQLiteRecordNotFoundException([message, int code]) : super(message, 'Record not found', code);
}

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'activity_contents.g.dart';

const int _activityIdLength = 50;
const int _dateTimeLength = 25;
const int _defaultColumnWidth = 50;
const int _maxColumnWidth = 100;

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called rewards.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rewards.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [
  ActivityContents,
], daos: [
  ActivityContentDao,
])
class RewardsDatabase extends _$RewardsDatabase {
  RewardsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [ActivityContents])
class ActivityContentDao extends DatabaseAccessor<RewardsDatabase> with _$ActivityContentDaoMixin {
  ActivityContentDao(RewardsDatabase db) : super(db);

  Future<List<ActivityContent>> getAllTasks() => select(activityContents).get();
  Stream<List<ActivityContent>> watchAllTasks() => select(activityContents).watch();
  Future insertTask(Insertable<ActivityContent> activityContent) => into(activityContents).insert(activityContent);
  Future updateTask(Insertable<ActivityContent> activityContent) => update(activityContents).replace(activityContent);
  Future deleteTask(Insertable<ActivityContent> activityContent) => delete(activityContents).delete(activityContent);
}

///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class ActivityContents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityId => text().withLength(min: 1, max: _activityIdLength)();
  RealColumn get amount => real().withDefault(Constant(0.0))();
  TextColumn get confirmationCancel => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get confirmationSave => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get confirmationTitle => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get dateCompleteCaption => text().withLength(min: 4, max: _dateTimeLength)();
  TextColumn get dateFormat => text().withLength(min: 1, max: 15).withDefault(Constant('MM-dd-yyy'))();
  TextColumn get details => text().withLength(min: 1, max: _maxColumnWidth)();
  TextColumn get imageUrl => text().withLength(min: 1, max: _maxColumnWidth)();
  TextColumn get language => text().withLength(min: 2, max: 2)();
  TextColumn get rewardType => text().withLength(min: 1, max: _defaultColumnWidth)();
  IntColumn get sequences => integer().withDefault(Constant(1))();
  TextColumn get setDateCaption => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get spinnerMessage => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get title => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get validFrom => text().withLength(min: 1, max: _dateTimeLength)();
  TextColumn get validUntil => text().withLength(min: 1, max: _dateTimeLength)();
}

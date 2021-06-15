import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'activity_contents.g.dart';

const int _activityIdLength = 50;
const int _amountLength = 10;
const int _dateTimeLength = 25;
const int _defaultColumnWidth = 50;
const int _maxColumnWidth = 100;
const int _memberIdLength = 50;

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rewards.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [
  ActivityContents,
  ActivityProgression,
  ActivityVersions,
  ActivityPerMembers,
])
class RewardsDatabase extends _$RewardsDatabase {
  RewardsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class ActivityContents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityId => text().withLength(min: 1, max: _activityIdLength)();
  TextColumn get amount => text().withLength(min: 1, max: _amountLength)();
  TextColumn get confirmationCancel => text().withLength(min: 7, max: _defaultColumnWidth)();
  TextColumn get confirmationSave => text().withLength(min: 4, max: _defaultColumnWidth)();
  TextColumn get confirmationTitle => text().withLength(min: 5, max: _defaultColumnWidth)();
  TextColumn get dateCompleteCaption => text().withLength(min: 4, max: _dateTimeLength)();
  TextColumn get dateFormat => text().withLength(min: 4, max: 15).withDefault(Constant('MM-dd-yyy'))();
  TextColumn get details => text().withLength(min: 1, max: _maxColumnWidth)();
  TextColumn get imageUrl => text().withLength(min: 1, max: _maxColumnWidth)();
  TextColumn get language => text().withLength(min: 2, max: 2)();
  TextColumn get rewardType => text().withLength(min: 1, max: _defaultColumnWidth)();
  IntColumn get sequences => integer().withDefault(Constant(1))();
  TextColumn get setDateCaption => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get spinnerMessage => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get title => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get validFrom => text().withLength(min: 10, max: _dateTimeLength)();
  TextColumn get validUntil => text().withLength(min: 10, max: _dateTimeLength)();
}

///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@DataClassName('ActivityProgress')
class ActivityProgression extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityId => text().withLength(min: 1, max: _activityIdLength)();
  TextColumn get amount => text().withLength(min: 1, max: _amountLength)();
  TextColumn get dateCompleted => text().withLength(min: 8, max: _dateTimeLength)();
  TextColumn get memberId => text().withLength(min: 4, max: _memberIdLength)();
  IntColumn get sequenceNumber => integer().withDefault(Constant(1))();
}

///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class ActivityVersions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityId => text().withLength(min: 1, max: _activityIdLength)();
  TextColumn get timeStamp => text().withLength(min: 1, max: _dateTimeLength)();
  TextColumn get title => text().withLength(min: 1, max: _defaultColumnWidth)();
}

///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class ActivityPerMembers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activityId => text().withLength(min: 1, max: _activityIdLength)();
  TextColumn get endingDate => text().withLength(min: 1, max: _dateTimeLength)();
  TextColumn get memberId => text().withLength(min: 4, max: _memberIdLength)();
  TextColumn get memberName => text().withLength(min: 1, max: _defaultColumnWidth)();
  TextColumn get startingDate => text().withLength(min: 1, max: _dateTimeLength)();
}

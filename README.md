# sqlite_explorer

Development package to let the developer query a [Drift](https://pub.dev/packages/drift) designed database.

## Install

```text
dependencies:
  sqlite_explorer:
    git:
      url: https://github.com/GitHubStuff/sqlite_explorer.git
```

## Import

```dart
import 'package:sqlite_explorer/sqlite_explorer.dart';
```

## Usage

By wrapping the body of a widget in the SqliteScreenWidget, a button icon appears at the bottom of the screen that will move on/off the explorer screen.

example:

```dart
     :
  final driftBridge = DriftBridge(dbName: 'example.sql', generatedDatabase: DriftDatabase()),
  return Scaffold(
            :
            :
            body: SqliteScreenWidget(
                     parentWidget: _body(),
                     enabled: true,
                     driftBridge: driftBridge,
                     rowsPerPage: 7,),
            :
            :
    );
```

### Note

Examples use DriftBridge are strictly illustrative, see the example app for best actual implementation and (hopefully) best coding practices.

#### Parameters

- _body() : the widget tree that would otherwise be displayed

- enabled : if true, the Explorer widget is available, if false just returns the _body() {after development is done, set this to false so the user never sees the Explorer.

- driftBridge : special class that bridges the drift database defined in the app to the explorer so the explorer can access the sqlite records and meta informaton

- rowsPerPage : the number of records displayed per page.

## MOOR_BRIDGE

Creating a database thru the use of [Drift](https://pub.dev/packages/drift) means at some point a LazyData class was created, with the Drift-style database:

```dart
/// Example

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called "rewards.sqlite" here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rewards.sqlite'));   //----- NOTE THE NAME rewards.sqlite
    return VmDatabase(file, logStatements: true);
  });
}


@UseDrift(tables: [ActivityContents,], daos: [ActivityContentDao,])
class RewardsDatabase extends _$RewardsDatabase {
  RewardsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
```

That object (RewardsDataBase) and the suffix used in LazyDatabase (eg: 'rewards.sqlite') are the parameters to the DriftBridge:

```dart
DriftBridge(dbName: 'rewards.sqlite' , generatedDatabase: RewardDatabase());
```

- **NOTE:** In the /example project these are all defined in [flutter_modular](https://pub.dev/packages/flutter_modular) Module. The flutter_modular is an A++ state manage package that handles route, dependency injection, a 'disposable singleton' system (see: ***reward_module.dart*** for an example of how the RewardsDatabase and DriftBridge are created using flutter_modular-singletons)

### ****Special Notes****

- This packages uses [theme_manager](https://github.com/GitHubStuff/theme_manager) so make sure ThemeManager.setup() is called in main().

- ***LazyDatabase*** has a 'logStatements' boolean {*see example of LazyDatabase above*} that writes all the sqlite queries/commands/responses to the console... for a ***PRODUCTION*** release this should probably be set to 'false'!

- The code for explorer is a refactored collection of code from a Medium article (can't attribute), specifically for using Drift, BLoC, and DI.

## Final Note

Be kind to each other!

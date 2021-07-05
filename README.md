# sqlite_explorer

Development package to let the developer query a [Moor](https://pub.dev/packages/moor) library database.

## Usage

By wrapping the body of a widget in the SqliteScreenWidget, a button icon appears at the bottom of the screen that will move on/off the explorer screen.

eg:

```dart
  return Scaffold(
            :
            :
            body: SqliteScreenWidget(
                     parentWidget: _body(),
                     enabled: true,
                     moorBridge: moorBridge,
                     rowsPerPage: 7,),
            :
            :
    );
```

- _body() : the widget tree that would otherwise be displayed

- enabled : if true, the Explorer widget is available, if false just returns the _body() {after development is done, set this to false so the user never sees the Explorer.

- moorBridge : special class that bridges the moor database defined in the app to the explorer so the explorer can access the sqlite records and meta informaton

- rowsPerPage : the number of records displayed per page.

## MOOR_BRIDGE

Creating a database thru the use of [Moor](https://pub.dev/packages/moor) means at some point a LazyData class was created, with the Moor-style database:

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


@UseMoor(tables: [ActivityContents,], daos: [ActivityContentDao,])
class RewardsDatabase extends _$RewardsDatabase {
  RewardsDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
```

That object (RewardsDataBase) and the suffix used in LazyDatabase (eg: 'rewards.sqlite') are the parameters to the MoorBridge:

```dart
MoorBridge(dbName: 'rewards.sqlite' , generatedDatabase: RewardDatabase());
```

- **NOTE:** In the /example project these are all defined in [flutter_modular](https://pub.dev/packages/flutter_modular) Module. The flutter_modular is an A++ state manage package that handles route, dependency injection, a 'disposable singleton' system (see: ***reward_module.dart*** for an example of how the RewardsDatabase and MoorBridge are created using flutter_modular-singletons)

### ****Special Notes****

- This packages uses [theme_manager](https://github.com/GitHubStuff/theme_manager) so make sure ThemeManager.setup() is called in main().

- ***LazyDatabase*** has a 'logStatements' boolean {*see example of LazyDatabase above*} that writes all the sqlite queries/commands/responses to the console... for a ***PRODUCTION*** release this should probably be set to 'false'!

- The code for explorer is a refactored collection of code from a Medium article (can't attribute), specifically for using Moor, BLoC, and DI.

## Final Note

Be kind to each other!

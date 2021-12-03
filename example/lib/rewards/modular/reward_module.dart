import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';

import '../constants.dart' as K;
import '../database/activity_contents.dart';
import '../login/login_widget.dart';

class RewardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ActivityContentDao(i())),
    Bind.factory((i) => DriftBridge(dbName: K.dbName, generatedDatabase: i())),
    Bind.singleton((i) => RewardsDatabase()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginWidget(title: K.dbName)),
  ];
}

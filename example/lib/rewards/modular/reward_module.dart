import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';

import '../constants.dart' as K;
import '../database/activity_contents.dart';
import '../login/login_widget.dart';

class RewardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RewardsDatabase()),
    Bind.factory((i) => MoorBridge(dbName: K.dbName, generatedDatabase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginWidget(title: K.dbName)),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extras/flutter_extras.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:persisted_cache/persisted_cache.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:tracers_package/tracers.dart';

import 'modular/app_module.dart';
import 'modular/theme_and_material_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Report flutter_bloc information to the console
  Bloc.observer = SimpleBlocObserver();

  /// Enable theme changes/monitoring by creating a 'hive' object to persist theme information
  await ThemeManager.setup();
  await Log.setTrace(baseLevel: LogLevel.All);

  final cache = PersistedCache(cacheId: 'Fi');
  for (int i = 0; i < 15; i++) {
    cache.addItem('Item $i');
  }
  final List<dynamic> items = cache.cachedItems();
  debugPrint('$items');

  runApp(ModularApp(
    module: AppModule(),
    child: ThemeAndMaterialWidget(),
  ));
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_explorer/src/fsm_datasource.dart';
import 'package:theme_manager/theme_manager.dart';

import '../src/constants.dart' as K;

part 'build_state.dart';

class BuildCubit extends Cubit<BuildState> {
  BuildCubit() : super(BuildInitial()) {
    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.blueGrey,
          light: Colors.red,
        ),
        forKey: K.circularProgressColor);

    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.black,
          light: Colors.black38,
        ),
        forKey: K.dividerColor);
    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.blueGrey,
          light: Colors.white70,
        ),
        forKey: K.safeAreaColor);

    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.green[900]!,
          light: Colors.white70,
        ),
        forKey: K.tableBackgroundColor);
    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.yellow,
          light: Colors.black,
        ),
        forKey: K.tableDataColor);
    ThemeManager.defaultThemeColors(
        ThemeColors(
          dark: Colors.yellow,
          light: Colors.black,
        ),
        forKey: K.tableHeaderColor);
    ThemeManager.defaultThemeColors(
      ThemeColors.mono(color: Colors.amber),
      forKey: K.tableNameColor,
    );
  }

  void build(List<DataColumn> columns, FSMDataSource source) {
    emit(BuildTable(columns, source));
  }

  void refresh() => emit(BuildInitial());
}

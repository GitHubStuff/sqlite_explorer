import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

const String circularProgressColor = '${_prefix}circularProgresColor';
const String defaultTextColor = '${_prefix}defaultTextColor';
const String dividerColor = '${_prefix}dividerColor';
const String iconColors = '${_prefix}iconColors';
const String modeColors = '${_prefix}modeColors';
const String safeAreaColor = '${_prefix}safeAreaColor';
const String tableDataColor = '${_prefix}tableDataColor';
const String tableHeaderColor = '${_prefix}tableHeaderColor';
const String tableListBackgroundColor = '${_prefix}tableListBackgroundColor';
const String tableNameColor = '${_prefix}tableNameColor';
const String tableBackgroundColor = '${_prefix}tableBackgroundColor';
const String _prefix = 'sqlite_explorer.';

Color color(String key, BuildContext context) => ThemeManager.color(key, context: context);

int rawRecordCount(BuildContext context) => 5;

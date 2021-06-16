import 'package:flutter/material.dart';
import 'package:theme_manager/theme_manager.dart';

const String circularProgressColor = '${_prefix}circularProgresColor';
const String dividerColor = '${_prefix}dividerColor';
const String safeAreaColor = '${_prefix}safeAreaColor';
const String tableDataColor = '${_prefix}tableDataColor';
const String tableHeaderColor = '${_prefix}tableHeaderColor';
const String tableNameColor = '${_prefix}tableNameColor';
const String tableBackgroundColor = '${_prefix}tableBackgroundColor';
const String _prefix = 'sqlite_explorer.';

Color color(String key, BuildContext context) => ThemeManager.color(key, context: context);

int rawRecordCount(BuildContext context) => 5;

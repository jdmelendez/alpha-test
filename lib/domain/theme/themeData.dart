import 'package:flutter/material.dart';

import 'theme.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryColor),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.primaryColor,
      elevation: 0,
      foregroundColor: AppTheme.white),
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  )),
);

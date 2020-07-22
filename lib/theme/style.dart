import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xff5e31b1);
  static final Color accentColor = Color(0xff9575cd);
  static final Color secondaryHeaderColor = Color(0xff9575cd);
  static final Color scaffoldBackgroundColornsity = Color(0xffaad9d9);
  static final VisualDensity visualDensity =
      VisualDensity.adaptivePlatformDensity;

  static final ThemeData data = ThemeData(
      primaryColor: AppTheme.primaryColor,
      accentColor: AppTheme.accentColor,
      secondaryHeaderColor: AppTheme.secondaryHeaderColor,
      visualDensity: AppTheme.visualDensity);
}

class AppDarkTheme {
  static final ThemeData data = ThemeData(
    brightness: Brightness.dark,
  );
}

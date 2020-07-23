import 'package:flutter/material.dart';

// APP THEME
import "package:sample_flutter_app/theme/style.dart";

// ROUTES
import "package:sample_flutter_app/constants/routes/main.dart";

// APP INFO
import "package:sample_flutter_app/app_info.dart";

void main() {
  runApp(SampleFlutterApp());
}

class SampleFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppInfo.title,
      theme: AppTheme.data,
      darkTheme: AppDarkTheme.data,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

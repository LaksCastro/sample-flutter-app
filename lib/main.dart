import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/home.dart';

// ENVIROMENT VARIABLES
import 'package:flutter_dotenv/flutter_dotenv.dart';

// APP THEME
import "package:sample_flutter_app/theme/style.dart";

void main() async {
  await DotEnv().load('.env');

  runApp(SampleFlutterApp());
}

class SampleFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample Flutter App",
      theme: AppTheme.data,
      darkTheme: AppDarkTheme.data,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

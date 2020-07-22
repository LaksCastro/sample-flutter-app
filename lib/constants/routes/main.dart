import 'package:flutter/material.dart';

import 'package:sample_flutter_app/screens/home.dart';
import 'package:sample_flutter_app/screens/images.dart';

class AppRoutes {
  static final String initialRoute = "/";
  static final Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => HomeScreen(),
    "/second": (context) => ImagesScreen()
  };
}

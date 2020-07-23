import 'package:flutter/material.dart';

import "package:sample_flutter_app/constants/routes/wrapper.dart";

class AppRoutes {
  static final String initialRoute = "/";

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    RoutesWrapper.all.forEach((key, value) {
      routes[value.path] = value.builderFunction;
    });

    return routes;
  }
}

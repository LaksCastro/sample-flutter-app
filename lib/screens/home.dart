import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/layout/main.dart';
import 'package:sample_flutter_app/models/RouteData/main.dart';

import 'package:sample_flutter_app/models/ScreenData/main.dart';

class HomeScreen extends StatelessWidget {
  static final RouteDataModel route = RouteDataModel(
    hasParams: false,
    path: "/",
    name: "Home",
    key: "home",
    description: "The App Home Screen",
  );

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(ScreenDataModel(
        appBarTitle: HomeScreen.route.name,
        body: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/second");
          },
          child: Text("Go to second Screen"),
        ))));
  }
}

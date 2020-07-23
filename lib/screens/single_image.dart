import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/models/RouteData/main.dart';
import 'package:sample_flutter_app/models/ScreenData/main.dart';

class SingleImageScreen extends StatelessWidget {
  static final RouteDataModel route = RouteDataModel(
      path: "/image",
      name: "View Image",
      key: "single_image",
      description: "Shows a Single Image Info",
      builderFunction: (context) => SingleImageScreen(),
      showInTab: false);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(ScreenDataModel(
        appBarTitle: SingleImageScreen.route.name,
        body: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/second");
          },
          child: Text("Go to second Screen"),
        ))));
  }
}

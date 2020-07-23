import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';
import 'package:sample_flutter_app/models/route_data/main.dart';

class ImagesScreen extends StatelessWidget {
  static final RouteDataModel route = RouteDataModel(
      path: "/images",
      name: "Image List",
      key: "images",
      description: "The Image Infinite Scroll Screen",
      builderFunction: (context) => ImagesScreen(),
      showInTab: false);

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(ScreenDataModel(
        appBarTitle: ImagesScreen.route.name,
        body: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
          child: Text("Go to First Screen"),
        ))));
  }
}

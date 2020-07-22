import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/models/ScreenData/main.dart';

class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(ScreenDataModel(
        appBarTitle: "Second Screen",
        body: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
          child: Text("Go to First Screen"),
        ))));
  }
}

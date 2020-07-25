import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/models/route_data/main.dart';
import 'package:sample_flutter_app/models/screen_data/main.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutComponent(ScreenDataModel(
        appBarTitle: "Settings",
        body: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/second");
          },
          child: Text("Go to second Screen"),
        ))));
  }
}

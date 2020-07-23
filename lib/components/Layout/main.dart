import "package:flutter/material.dart";

import 'package:sample_flutter_app/models/screen_data/main.dart';

import 'package:sample_flutter_app/components/drawer/main.dart';

class LayoutComponent extends StatelessWidget {
  final ScreenDataModel data;

  LayoutComponent(this.data) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.appBarTitle),
        ),
        drawer: DrawerComponent(),
        body: data.body);
  }
}

import "package:flutter/material.dart";

import 'package:sample_flutter_app/models/screen_data/main.dart';

import 'package:sample_flutter_app/components/drawer/main.dart';

class LayoutComponent extends StatelessWidget {
  final ScreenDataModel args;

  LayoutComponent({this.args}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(args.appBarTitle),
        ),
        drawer: DrawerComponent(),
        body: args.body);
  }
}

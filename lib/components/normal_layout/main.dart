import "package:flutter/material.dart";

import 'package:sample_flutter_app/models/screen_data/main.dart';

class NormalLayoutComponent extends StatelessWidget {
  final ScreenDataModel args;

  NormalLayoutComponent({this.args}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(args.appBarTitle),
        ),
        body: args.body);
  }
}

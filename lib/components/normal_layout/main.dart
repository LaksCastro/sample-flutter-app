import "package:flutter/material.dart";

import 'package:sample_flutter_app/models/screen_data/main.dart';

class NormalLayoutComponent extends StatelessWidget {
  final ScreenDataModel data;

  NormalLayoutComponent(this.data) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.appBarTitle),
        ),
        body: data.body);
  }
}

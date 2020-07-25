import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/normal_layout/main.dart';
import 'package:sample_flutter_app/models/images_screen_args/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';

class ImagesScreen extends StatefulWidget {
  final ImagesScreenArgs args;

  ImagesScreen({this.args});

  @override
  _ImagesScreenState createState() {
    return _ImagesScreenState(args: args);
  }
}

class _ImagesScreenState extends State<ImagesScreen> {
  final ImagesScreenArgs args;
  bool loading = true;
  Timer timer;

  _ImagesScreenState({this.args});

  @override
  void initState() {
    timer = Timer(Duration(milliseconds: 1500), () {
      setState(() {
        loading = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = loading
        ? Center(child: CircularProgressIndicator())
        : Center(child: Text(args.title));

    return NormalLayoutComponent(
        ScreenDataModel(appBarTitle: args.title, body: body));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/normal_layout/main.dart';
import 'package:sample_flutter_app/constants/home_screen/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';
import 'package:sample_flutter_app/models/route_data/main.dart';

class ImagesScreen extends StatefulWidget {
  static final RouteDataModel route = RouteDataModel(
      path: "/images",
      name: "Image List",
      key: "images",
      description: "The Image Infinite Scroll Screen",
      builderFunction: (context) => ImagesScreen(),
      showInTab: false);

  @override
  _ImagesScreenState createState() {
    return _ImagesScreenState();
  }
}

class _ImagesScreenState extends State<ImagesScreen> {
  bool loading = true;
  Timer timer;

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
    final HomeCardInfo args = ModalRoute.of(context).settings.arguments;

    Widget body = loading
        ? Center(child: CircularProgressIndicator())
        : Center(child: Text(args.title));

    return NormalLayoutComponent(
        ScreenDataModel(appBarTitle: args.title, body: body));
  }
}

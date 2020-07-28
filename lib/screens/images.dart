import 'package:flutter/material.dart';
import 'package:sample_flutter_app/components/image_scrolling/main.dart';

import 'package:sample_flutter_app/models/image_scrolling_args/main.dart';
import 'package:sample_flutter_app/models/images_screen_args/main.dart';

import 'package:sample_flutter_app/components/normal_layout/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';

class ImagesScreen extends StatelessWidget {
  final ImagesScreenArgs args;

  ImagesScreen({this.args});

  @override
  Widget build(BuildContext context) {
    return NormalLayoutComponent(
      args: ScreenDataModel(
          appBarTitle: args.title,
          body: ImageScrolling(args: ImageScrollingArgs(query: args.query))),
    );
  }
}

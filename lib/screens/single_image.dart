import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/components/image_scrolling/main.dart';

import 'package:sample_flutter_app/components/normal_layout/main.dart';
import 'package:sample_flutter_app/models/image_scrolling_args/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';
import 'package:sample_flutter_app/models/single_image_screen_args/main.dart';
import 'package:sample_flutter_app/models/image_scrolling_args/main.dart';

import 'package:sample_flutter_app/utils/main.dart';

class SingleImageScreen extends StatefulWidget {
  final SingleImageScreenArgs args;

  SingleImageScreen({this.args});

  @override
  SingleImageScreenState createState() => SingleImageScreenState(args: args);
}

class SingleImageScreenState extends State<SingleImageScreen> {
  SingleImageScreenArgs args;

  SingleImageScreenState({this.args});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
              child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: 500,
            imageUrl: args.image.url.full,
            placeholderFadeInDuration: Duration(milliseconds: 100),
            fadeOutDuration: Duration(milliseconds: 100),
            placeholder: (context, url) {
              return Container(
                  height: 500,
                  color: Utils.colorFromHexString(args.image.color));
            },
          )),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: ImageScrolling(args: ImageScrollingArgs(query: args.query)),
        )
      ]),
    );

    Widget floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.file_download),
    );

    return NormalLayoutComponent(
      args: ScreenDataModel(
          appBarTitle: "Image",
          body: body,
          floatingActionButton: floatingActionButton),
    );
  }
}

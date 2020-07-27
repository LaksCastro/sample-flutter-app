import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sample_flutter_app/models/image_data/main.dart';
import 'package:sample_flutter_app/services/unsplash.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:sample_flutter_app/components/normal_layout/main.dart';
import 'package:sample_flutter_app/models/images_screen_args/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';
import 'package:sample_flutter_app/utils/main.dart';

class ImagesScreen extends StatefulWidget {
  final ImagesScreenArgs args;

  ImagesScreen({this.args});

  @override
  _ImagesScreenState createState() {
    return _ImagesScreenState(args: args);
  }
}

class _ImagesScreenState extends State<ImagesScreen> {
  ScrollController _controller;

  final String unsplashClientId = DotEnv().env["UNSPLASH_CLIENT_ID"];

  Future<List<ImageData>> Function({int page}) fetchImagesOn;

  List<ImageData> images = [];

  int page = 1;

  final ImagesScreenArgs args;
  bool initialLoad = true;
  bool loading = false;
  bool unmounted = false;

  _ImagesScreenState({this.args});

  void _fetchImages() async {
    if (unmounted) {
      return;
    }

    setState(() {
      loading = true;
    });

    var fetchedImages;

    try {
      fetchedImages = await fetchImagesOn(page: page);
    } catch (e) {
      return print(e);
    }

    if (unmounted) {
      return;
    }

    setState(() {
      images.addAll(fetchedImages);
      page++;
      initialLoad = false;
      loading = false;
    });
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent - 300 &&
        !_controller.position.outOfRange) {
      if (!loading) {
        _fetchImages();
      }
    }
  }

  int getColumnsLength(double screenWidth) {
    int columnsLength = 0;

    Map<int, int> breakpoints = {
      1100: 7,
      940: 6,
      800: 5,
      680: 4,
      460: 3,
      350: 2,
      260: 1,
    };

    breakpoints.forEach((key, value) {
      if (screenWidth > key && columnsLength == 0) {
        columnsLength = value;
      }
    });

    return columnsLength;
  }

  @override
  void initState() {
    UnsplashApi api = UnsplashApi(unsplashClientId: unsplashClientId);
    fetchImagesOn = api.getByKeyword(args.query);

    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    _fetchImages();

    super.initState();
  }

  @override
  void dispose() {
    unmounted = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columnsLength = getColumnsLength(screenWidth);

    Widget body = initialLoad
        ? Center(child: CircularProgressIndicator())
        : (StaggeredGridView.count(
            controller: _controller,
            crossAxisCount: columnsLength,
            children: List.generate(images.length, (int index) {
              return _Tile(image: images[index], columnsLength: columnsLength);
            }),
            staggeredTiles: List.generate(images.length, (int index) {
              return StaggeredTile.fit(1);
            })));

    return NormalLayoutComponent(
        ScreenDataModel(appBarTitle: args.title, body: body));
  }
}

class _Tile extends StatelessWidget {
  final ImageData image;
  final int columnsLength;

  _Tile({this.image, this.columnsLength});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var getHeightForThisWidth = Utils.interpolate(
        xInterval: [0, image.width], yInterval: [0, image.height]);

    double padding = 2.5;

    double height =
        getHeightForThisWidth((screenWidth - padding * 2) / columnsLength);

    return Container(
        padding: EdgeInsets.all(padding),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              placeholderFadeInDuration: Duration(microseconds: 200),
              imageUrl: image.url,
              placeholder: (context, url) => Container(
                  height: height, color: Utils.colorFromHexString(image.color)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )));
  }
}

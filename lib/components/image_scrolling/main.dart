import 'package:flutter/material.dart';

import 'package:sample_flutter_app/models/image_data/main.dart';
import 'package:sample_flutter_app/models/image_scrolling_args/main.dart';
import 'package:sample_flutter_app/models/single_image_screen_args/main.dart';
import 'package:sample_flutter_app/screens/single_image.dart';
import 'package:sample_flutter_app/services/unsplash.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:sample_flutter_app/utils/main.dart';

class ImageScrolling extends StatefulWidget {
  final ImageScrollingArgs args;

  ImageScrolling({this.args});

  @override
  _ImageScrollingState createState() {
    return _ImageScrollingState(args: args);
  }
}

class _ImageScrollingState extends State<ImageScrolling> {
  ScrollController _controller;

  final String _unsplashClientId = DotEnv().env["UNSPLASH_CLIENT_ID"];

  Future<List<ImageData>> Function({int page}) _fetchImagesOn;

  List<ImageData> _images = [];

  int _page = 1;

  final ImageScrollingArgs args;
  bool initialLoad = true;
  bool loading = false;
  bool unmounted = false;

  _ImageScrollingState({this.args});

  void _fetchImages() async {
    if (unmounted) {
      return;
    }

    setState(() {
      loading = true;
    });

    var fetchedImages;

    try {
      fetchedImages = await _fetchImagesOn(page: _page);
    } catch (e) {
      return print(e);
    }

    if (unmounted) {
      return;
    }

    setState(() {
      _images.addAll(fetchedImages);
      _page++;
      initialLoad = false;
      loading = false;
    });
  }

  void _scrollListener() {
    var triggerFetchMoreSize = 0.9 * _controller.position.maxScrollExtent;

    if (_controller.position.pixels > triggerFetchMoreSize) {
      if (loading) {
        return;
      }
      _fetchImages();
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
    UnsplashApi api = UnsplashApi(unsplashClientId: _unsplashClientId);
    _fetchImagesOn = api.getByKeyword(args.query);

    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    _fetchImages();

    super.initState();
  }

  @override
  void dispose() {
    unmounted = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columnsLength = getColumnsLength(screenWidth);

    Widget body = initialLoad
        ? Center(child: CircularProgressIndicator())
        : (GridView.count(
            crossAxisCount: columnsLength,
            controller: _controller,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            padding: EdgeInsets.all(4),
            children: List.generate(_images.length, (index) {
              return _Tile(
                image: _images[index],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleImageScreen(
                              args: SingleImageScreenArgs(
                                  image: _images[index], query: args.query))));
                },
              );
            }),
          ));

    return body;
  }
}

class _Tile extends StatelessWidget {
  final ImageData image;
  final void Function() onTap;

  _Tile({this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholderFadeInDuration: Duration(milliseconds: 100),
              imageUrl: image.url.small,
              placeholder: (context, url) =>
                  Container(color: Utils.colorFromHexString(image.color)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )));
  }
}

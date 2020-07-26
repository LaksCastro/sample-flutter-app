import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/images_screen_args/main.dart';
import 'package:sample_flutter_app/screens/images.dart';

class Categories {
  static final List<_Category> categories = [
    _Category(title: "Explore", items: [
      _Item(
        label: "Minimalist",
        color: Colors.white,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "minimalist", title: "Minimalist")),
      ),
      _Item(
        label: "Fractal",
        color: Colors.orange,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "fractal", title: "Fractal")),
      ),
      _Item(
        label: "Futurism",
        color: Colors.blue,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "futuristic", title: "Futurism")),
      ),
    ]),
    _Category(title: "Diverse", items: [
      _Item(
        label: "People",
        color: Colors.brown,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "people", title: "People")),
      ),
      _Item(
        label: "Nature",
        color: Colors.green,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "nature", title: "Nature")),
      ),
      _Item(
        label: "Dead Nature",
        color: Colors.blueGrey,
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "dead-nature", title: "Dead Nature")),
      ),
    ]),
    _Category(title: "Animals", items: [
      _Item(
        label: "Cats",
        color: Colors.lightBlue[400],
        builder: (context) =>
            ImagesScreen(args: ImagesScreenArgs(query: "cats", title: "Cats")),
      ),
      _Item(
        label: "Dogs",
        color: Colors.yellow,
        builder: (context) =>
            ImagesScreen(args: ImagesScreenArgs(query: "dogs", title: "Dogs")),
      ),
      _Item(
        label: "Cute",
        color: Colors.pink,
        builder: (context) => ImagesScreen(
            args:
                ImagesScreenArgs(query: "cute-animals", title: "Cute Animals")),
      ),
    ]),
    _Category(title: "Geometric", items: [
      _Item(
        label: "Endless",
        color: Colors.purple,
        builder: (context) => ImagesScreen(
            args:
                ImagesScreenArgs(query: "endless", title: "Endless Geometric")),
      ),
      _Item(
        label: "Abstract",
        color: Colors.red[300],
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "abstract", title: "Abstract")),
      ),
      _Item(
        label: "Colorful",
        color: Colors.yellow[300],
        builder: (context) => ImagesScreen(
            args: ImagesScreenArgs(query: "colorful", title: "Colorful")),
      ),
    ])
  ];
}

class _Category {
  final String title;
  final List<_Item> items;

  _Category({this.title, this.items});
}

class _Item {
  final String label;
  final Color color;
  final Widget Function(BuildContext context) builder;

  _Item({this.label, this.color, this.builder});
}

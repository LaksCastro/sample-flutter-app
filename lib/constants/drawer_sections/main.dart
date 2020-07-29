import 'package:flutter/cupertino.dart';

import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:sample_flutter_app/models/images_screen_args/main.dart';
import 'package:sample_flutter_app/screens/images.dart';
import 'package:sample_flutter_app/screens/home.dart';

class DrawerSections {
  static final List<_DrawerTabs> sections = [
    _DrawerTabs(title: "Pages", tabs: [
      _Tab(
          label: "Home",
          icon: OMIcons.home,
          builder: (context) => HomeScreen()),
    ]),
    _DrawerTabs(
      title: "Explore",
      tabs: [
        _Tab(
            label: "Minimalist Nature",
            icon: OMIcons.terrain,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(
                    title: "Minimalist Nature", query: "minimalist-nature"))),
        _Tab(
            label: "Abstract Fractal",
            icon: OMIcons.brightness5,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(
                    title: "Abstract Fractal", query: "abstract-fractal"))),
        _Tab(
            label: "Darker Nature",
            icon: OMIcons.filterBAndW,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(
                    title: "Darker Nature", query: "darker-nature"))),
        _Tab(
            label: "Endless Geometric",
            icon: OMIcons.widgets,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(
                    title: "Endless Geometric", query: "geometric"))),
        _Tab(
            label: "Colorful",
            icon: OMIcons.localFlorist,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(title: "Colorful", query: "colorful"))),
        _Tab(
            label: "Futurism",
            icon: OMIcons.timelapse,
            builder: (context) => ImagesScreen(
                args: ImagesScreenArgs(title: "Futurism", query: "future"))),
      ],
    )
  ];
}

class _DrawerTabs {
  final String title;
  final List<_Tab> tabs;

  _DrawerTabs({this.title, this.tabs});
}

class _Tab {
  final String label;
  final IconData icon;
  final Widget Function(BuildContext context) builder;

  _Tab({this.label, this.builder, this.icon});
}

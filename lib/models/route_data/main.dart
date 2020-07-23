import "package:flutter/material.dart";

typedef BuilderFunction = Widget Function(BuildContext context);

class RouteDataModel {
  final String name;
  final String description;
  final String key;
  final String path;
  final Widget Function(BuildContext) builderFunction;
  final IconData icon;
  final bool showInTab;

  RouteDataModel(
      {this.name,
      this.description,
      this.key,
      this.path,
      this.builderFunction,
      this.icon,
      this.showInTab = true});
}

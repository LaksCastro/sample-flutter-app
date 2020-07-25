import "package:flutter/material.dart";

import "package:sample_flutter_app/constants/routes/tabs.dart";
import 'package:sample_flutter_app/models/route_data/main.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, RouteDataModel> tabs = TabsRoutes.getTabs();

    List<StatelessWidget> tabsWidgets = [];

    tabs.forEach((key, value) {
      RouteDataModel tab = tabs[key];

      tabsWidgets.add(ListTile(
        leading: Icon(tab.icon),
        title: Text(tab.name),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        onTap: () {
          Navigator.pushReplacementNamed(context, tab.path);
        },
      ));
    });

    List<StatelessWidget> children = [
      ListTile(
        title: Text(
          "Sample App",
          style: TextStyle(
              fontFamily: "DancingScript",
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
      )
    ];

    children.addAll(tabsWidgets);

    return Drawer(
      child: SafeArea(
          child: ListView(padding: EdgeInsets.zero, children: children)),
    );
  }
}

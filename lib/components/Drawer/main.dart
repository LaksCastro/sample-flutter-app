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
        onTap: () {
          Navigator.pushReplacementNamed(context, tab.path);
        },
      ));
    });

    List<StatelessWidget> children = [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          'Drawer Header',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ];

    children.addAll(tabsWidgets);

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: children),
    );
  }
}

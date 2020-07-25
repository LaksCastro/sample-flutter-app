import "package:flutter/material.dart";

import 'package:sample_flutter_app/constants/drawer_sections/main.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sections = DrawerSections.sections;

    List<StatelessWidget> drawerWidgets = [];

    sections.forEach((section) {
      var title = section.title;
      var tabs = section.tabs;

      drawerWidgets.add(Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
          child: Opacity(
            opacity: 0.5,
            child: Text(
              title,
            ),
          )));

      tabs.forEach((tab) {
        drawerWidgets.add(ListTile(
          leading: Icon(tab.icon),
          title: Text(tab.label),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: tab.builder));
          },
        ));
      });
    });

    List<StatelessWidget> children = [
      ListTile(
        title: Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Sample App",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )),
      )
    ];

    children.addAll(drawerWidgets);

    return Drawer(
      child: SafeArea(
          child: ListView(padding: EdgeInsets.zero, children: children)),
    );
  }
}

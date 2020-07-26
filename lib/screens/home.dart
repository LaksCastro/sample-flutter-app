import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/constants/home_categories/main.dart';

import 'package:sample_flutter_app/models/screen_data/main.dart';

class HomeScreen extends StatelessWidget {
  final double size = 150.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewContainer = [];

    Categories.categories.forEach((category) {
      List<Widget> cards = [];

      category.items.forEach((item) {
        cards.add(GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: item.builder));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [
                        item.color,
                        Color.lerp(item.color, Colors.black, 0.5)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp)),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              width: size,
              height: size,
              child: Text(item.label, style: TextStyle(color: Colors.white)),
            )));
      });

      listViewContainer.add(Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(category.title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Container(
                height: size,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  children: cards,
                ))
          ])));
    });

    return LayoutComponent(ScreenDataModel(
        appBarTitle: "Home",
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: listViewContainer,
            ))));
  }
}

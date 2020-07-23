import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/home_card_wrapper/main.dart';
import 'package:sample_flutter_app/components/home_card/main.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/constants/home_screen/main.dart';

import 'package:sample_flutter_app/models/route_data/main.dart';
import 'package:sample_flutter_app/models/screen_data/main.dart';

class HomeScreen extends StatelessWidget {
  static final RouteDataModel route = RouteDataModel(
      path: "/",
      name: "Home",
      key: "home",
      description: "The App Home Screen",
      builderFunction: (context) => HomeScreen(),
      icon: Icons.home);

  final double size = 250.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewContainer = [];

    for (int i = 0; i < homeCards.length; i++) {
      List<HomeCardInfo> elements = homeCards[i];

      List<Widget> cards = [];

      for (int j = 0; j < elements.length; j++) {
        HomeCardInfo element = elements[j];
        cards.add(Container(
          width: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: Colors.red),
          child: Text(element.title),
          margin: EdgeInsets.symmetric(horizontal: 10),
        ));
      }

      listViewContainer.add(Container(
          height: size,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: cards,
          )));
    }

    return LayoutComponent(ScreenDataModel(
        appBarTitle: HomeScreen.route.name,
        body: ListView(
          children: listViewContainer,
          padding: EdgeInsets.symmetric(vertical: 10),
        )));
  }
}

// Container(height: 100, color: Colors.red)

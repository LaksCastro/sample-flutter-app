import 'package:flutter/material.dart';

import 'package:sample_flutter_app/components/home_card_wrapper/main.dart';
import 'package:sample_flutter_app/components/home_card/main.dart';

import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:sample_flutter_app/components/layout/main.dart';

import 'package:sample_flutter_app/constants/home_screen/main.dart';

import 'package:sample_flutter_app/models/route_data/main.dart';
import 'package:sample_flutter_app/models/screen_data/main.dart';

const url =
    "https://images.unsplash.com/photo-1593642532744-d377ab507dc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

class HomeScreen extends StatelessWidget {
  static final RouteDataModel route = RouteDataModel(
      path: "/",
      name: "Home",
      key: "home",
      description: "The App Home Screen",
      builderFunction: (context) => HomeScreen(),
      icon: OMIcons.home);

  final double size = 150.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewContainer = [];

    for (int i = 0; i < homeCards.length; i++) {
      List<HomeCardInfo> elements = homeCards[i];

      List<Widget> cards = [];

      for (int j = 0; j < elements.length; j++) {
        HomeCardInfo element = elements[j];
        cards.add(GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/images", arguments: element);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(children: [
                    Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: FittedBox(
                          child: Image.network(url),
                          fit: BoxFit.cover,
                        )),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomLeft,
                        width: size,
                        height: size,
                        padding: EdgeInsets.all(20),
                        child: Text(element.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )))
                  ])),
            )));
      }

// Stack(children: [
//                   Text(element.title,
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
//                 ])

      listViewContainer.add(Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(),
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text("SIM CARALHO",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            Container(
                height: size,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  children: cards,
                ))
          ])));
    }

    return LayoutComponent(ScreenDataModel(
        appBarTitle: HomeScreen.route.name,
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: listViewContainer,
            ))));
  }
}

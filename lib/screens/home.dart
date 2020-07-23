import 'package:flutter/material.dart';
import 'package:sample_flutter_app/components/HomeCardWrapper/main.dart';
import 'package:sample_flutter_app/components/HomeCard/main.dart';

import 'package:sample_flutter_app/components/layout/main.dart';
import 'package:sample_flutter_app/models/RouteData/main.dart';

import 'package:sample_flutter_app/models/ScreenData/main.dart';

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
    List<Widget> teste = [];

    List.generate(20, (index) {
      teste.add(Container(
          height: size,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: size,
                color: Colors.red,
              ),
              Container(
                width: size,
                color: Colors.blue,
              ),
              Container(
                width: size,
                color: Colors.green,
              ),
              Container(
                width: size,
                color: Colors.yellow,
              ),
              Container(
                width: size,
                color: Colors.orange,
              ),
            ],
          )));
    });

    return LayoutComponent(ScreenDataModel(
        appBarTitle: HomeScreen.route.name, body: ListView(children: teste)));
  }
}

// Container(height: 100, color: Colors.red)

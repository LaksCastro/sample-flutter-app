import "package:flutter/material.dart";

class HomeCardWrapperComponent extends StatelessWidget {
  HomeCardWrapperComponent({this.items}) : super();

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: items,
        ),
        color: Colors.green);
  }
}

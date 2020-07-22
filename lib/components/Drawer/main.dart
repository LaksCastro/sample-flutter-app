import "package:flutter/material.dart";

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.format_list_numbered),
          title: Text('First Screen'),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
        ListTile(
          leading: Icon(Icons.format_list_numbered),
          title: Text('Second Screen'),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/second");
          },
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text('Toggle Theme'),
          onTap: () {},
        ),
      ]),
    );
  }
}

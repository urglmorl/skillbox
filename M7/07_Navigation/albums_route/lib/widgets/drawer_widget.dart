import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  final String currentRoute;
  DrawerWidget({Key key, @required this.currentRoute}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<MenuItem> menus = [
    new MenuItem(title: 'Home', link: '/'),
    new MenuItem(title: 'Albums', link: '/artists'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          final menuItem = menus[index];
          return ListTile(
            title: Text(
              menuItem.title,
              style: TextStyle(
                color: widget.currentRoute == menuItem.link
                    ? Colors.blue
                    : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(menuItem.link);
            },
          );
        },
      ),
    );
  }
}

class MenuItem {
  String title;
  String link;

  MenuItem({
    @required this.title,
    @required this.link,
  });
}

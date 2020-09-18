import 'package:flutter/material.dart';
import 'package:albums_route/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(
        currentRoute: HomeScreen.route,
      ),
      body: Container(),
    );
  }
}

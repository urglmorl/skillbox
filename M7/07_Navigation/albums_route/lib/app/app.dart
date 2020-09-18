import 'package:flutter/material.dart';
import 'package:albums_route/utils/fluro_router.dart';

class RoutingApplication extends StatelessWidget {
  const RoutingApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: FluroRouter.router.generator,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return Container();
        });
      },
    );
  }
}

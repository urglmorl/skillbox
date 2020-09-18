import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:albums_route/screens/home_screen.dart';
import 'package:albums_route/screens/artists_screen.dart';
import 'package:albums_route/screens/artist_detail_screen.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomeScreen();
  });

  static Handler _artistsHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ArtistsScreen();
  });

  static Handler _artistDetailHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ArtistDetailScreen(
      link: params['link'].first,
    );
  });

  static void init() {
    router.define(HomeScreen.route, handler: _homeHandler);
    router.define(ArtistsScreen.route, handler: _artistsHandler);
    router.define(ArtistDetailScreen.route, handler: _artistDetailHandler);
  }
}

import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/hotel_view.dart';

class FluroRouter {
  static fluro.Router router = fluro.Router();

  static fluro.Handler _homeHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomeView();
  });

  static fluro.Handler _hotelDetailHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HotelView(
      id: params['id'].first,
    );
  });

  static void init() {
    router.define(HomeView.route, handler: _homeHandler);
    router.define(HotelView.route, handler: _hotelDetailHandler);
  }
}

import 'package:flutter/material.dart';
import 'package:albums_route/utils/fluro_router.dart';
import 'package:albums_route/app/app.dart';

void main() {
  FluroRouter.init();
  runApp(RoutingApplication());
}

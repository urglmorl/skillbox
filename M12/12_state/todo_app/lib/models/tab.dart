import 'package:flutter/material.dart';

class TabModel {
  UniqueKey id;
  String title;
  Color appBarColor;
  Widget appBarWidget;
  Widget body;

  TabModel({
    this.title,
    this.appBarColor,
    this.appBarWidget,
    this.body,
  }) : this.id = UniqueKey();
}

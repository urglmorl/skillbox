import 'package:flutter/cupertino.dart';

class Todo {
  UniqueKey id;
  String title;
  bool isDone;

  Todo({this.title})
      : this.id = UniqueKey(),
        this.isDone = false;

  toggle() {
    this.isDone = !this.isDone;
  }
}

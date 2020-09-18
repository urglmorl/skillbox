import 'package:flutter/cupertino.dart';

class Artist {
  String name;
  String link;
  String about;

  Artist({
    @required name,
    @required link,
    @required about,
  });

  Artist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'],
        about = json['about'];
}

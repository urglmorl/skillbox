import 'package:flutter/services.dart';
import 'package:albums_route/models/artist.dart';
import 'dart:convert';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => file);
}

List<Artist> parseArtistsFromString(String data) {
  final List<dynamic> result = jsonDecode(data);
  List<Artist> artists = result.map((e) => Artist.fromJson(e)).toList();
  return artists;
}

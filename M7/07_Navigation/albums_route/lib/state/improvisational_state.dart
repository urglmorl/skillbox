import 'package:albums_route/models/artist.dart';

class ImprovisationalState {
  static List<Artist> _artists = List();

  static void setArtists(List<Artist> artists) {
    _artists = artists;
  }

  static List<Artist> getArtists() {
    return _artists;
  }

  static Artist getArtistByLink(String link) {
    return _artists.singleWhere((element) => element.link == link);
  }
}

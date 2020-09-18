import 'package:flutter/material.dart';
import 'package:albums_route/screens/artists_screen.dart';
import 'package:albums_route/state/improvisational_state.dart';
import 'package:albums_route/models/artist.dart';

class ArtistDetailScreen extends StatefulWidget {
  static String route = '${ArtistsScreen.route}/:link';
  final String link;
  ArtistDetailScreen({Key key, @required this.link}) : super(key: key);

  @override
  _ArtistDetailScreenState createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
  Artist artist;

  @override
  void initState() {
    super.initState();
    artist = ImprovisationalState.getArtistByLink(widget.link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: SingleChildScrollView(
        child: Text(artist.about),
      ),
    );
  }
}

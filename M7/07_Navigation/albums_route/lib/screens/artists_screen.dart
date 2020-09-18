import 'package:flutter/material.dart';
import 'package:albums_route/widgets/drawer_widget.dart';
import 'package:albums_route/models/artist.dart';
import 'package:albums_route/utils/fetch_file.dart';
import 'package:albums_route/state/improvisational_state.dart';

class ArtistsScreen extends StatefulWidget {
  static String route = '/artists';
  ArtistsScreen({Key key}) : super(key: key);

  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(
        currentRoute: ArtistsScreen.route,
      ),
      body: FutureBuilder(
        future: fetchFileFromAssets('assets/artists.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            }
            List<Artist> artists = parseArtistsFromString(snapshot.data);
            ImprovisationalState.setArtists(artists);
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final Artist artist = artists[index];
                return ListTile(
                  title: Text(artist.name),
                  onTap: () {
                    Navigator.of(context).pushNamed('/artists/${artist.link}');
                  },
                );
              },
              itemCount: artists.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

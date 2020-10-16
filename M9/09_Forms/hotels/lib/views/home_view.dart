import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/network/api.dart';

class HomeView extends StatefulWidget {
  static String route = '/';
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ViewType _viewType = ViewType.LIST;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if (_viewType == ViewType.LIST) return;
                  setState(() {
                    _viewType = ViewType.LIST;
                  });
                },
                child: Icon(
                  Icons.list,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if (_viewType == ViewType.GRID) return;
                  setState(() {
                    _viewType = ViewType.GRID;
                  });
                },
                child: Icon(Icons.apps),
              )),
        ],
      ),
      body: FutureBuilder(
        future: Api.getHotels(),
        builder:
            (BuildContext context, AsyncSnapshot<List<HotelPreview>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError) {
              final hotels = snapshot.data;
              return _viewType == ViewType.LIST
                  ? ListView.builder(
                      itemCount: hotels.length,
                      itemBuilder: (BuildContext context, int index) {
                        final hotel = hotels[index];
                        return Card(
                          elevation: 10.0,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 24.0 / 11.0,
                                child: Image.asset(
                                  'assets/images/${hotel.poster}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(hotel.name),
                                    ),
                                    RaisedButton(
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      child: SizedBox(
                                        width: 75,
                                        child: Text(
                                          'Подробнее',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/${hotel.uuid}');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : GridView.count(
                      primary: true,
                      crossAxisSpacing: 1.0,
                      crossAxisCount: 2,
                      children: hotels.map((hotel) {
                        return Card(
                          elevation: 10.0,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 24.0 / 11.0,
                                child: Image.asset(
                                  'assets/images/${hotel.poster}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    hotel.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: RaisedButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text(
                                    'Подробнее',
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/${hotel.uuid}');
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
            } else {
              print(snapshot.error);
              return Center(
                child: Text('Возникла ошибка'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

enum ViewType {
  LIST,
  GRID,
}

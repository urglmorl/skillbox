import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/network/api.dart';

class Info {
  final String title;
  final String value;
  Info({this.title, this.value});
}

class HotelView extends StatefulWidget {
  static String route = '/:id';
  final String id;
  HotelView({this.id, Key key}) : super(key: key);

  @override
  _HotelViewState createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  Widget _hotelDetails(HotelDetail hotel) {
    List<Info> _generalInformation = [
      Info(title: 'Страна: ', value: '${hotel.address.country}'),
      Info(title: 'Город: ', value: '${hotel.address.city}'),
      Info(title: 'Улица: ', value: '${hotel.address.street}'),
      Info(title: 'Рейтинг: ', value: '${hotel.rating}'),
    ];

    Map<String, List<String>> _serviceInformation = {
      'Платные': hotel.services.paid,
      'Бесплатно': hotel.services.free,
    };

    return ListView(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 200.0),
          items: hotel.photos.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Image.asset(
                    'assets/images/$i',
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._generalInformation.map((info) {
                return info.value != null
                    ? Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Text(info.title),
                            Text(
                              info.value,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null;
              }),
              Container(
                height: 20.0,
              ),
              Text(
                'Сервисы',
                style: TextStyle(fontSize: 30.0),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _serviceInformation.keys.toList().map((key) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_serviceInformation[key].length > 0)
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 7.0),
                            child: Text(
                              key,
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ..._serviceInformation[key].map((service) {
                          return Text(service);
                        })
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getHotelById(widget.id),
        builder: (BuildContext context, AsyncSnapshot<HotelDetail> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // С сервера некорректно получается ошибка, поэтому приходится костылить
            if (snapshot.hasError || snapshot.data.uuid == null) {
              return Center(
                child: Text(snapshot.error ?? 'Контент временно недоступен'),
              );
            } else {
              return _hotelDetails(snapshot.data);
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

import 'dart:convert';

import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<HotelPreview>> getHotels() async {
    final response = await http
        .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
    var data = json.decode(response.body);
    final List<HotelPreview> hotels = data
        .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
        .toList();
    return hotels;
  }

  static Future<HotelDetail> getHotelById(String id) async {
    final response = await http.get('https://run.mocky.io/v3/$id');
    var data = json.decode(response.body);
    final hotel = HotelDetail.fromJson(data);
    return hotel;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) {
  return HotelPreview(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
  );
}

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelDetail _$HotelDetailFromJson(Map<String, dynamic> json) {
  return HotelDetail(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
    address: json['address'] == null
        ? null
        : HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
    price: (json['price'] as num)?.toDouble(),
    rating: (json['rating'] as num)?.toDouble(),
    services: json['services'] == null
        ? null
        : HotelServices.fromJson(json['services'] as Map<String, dynamic>),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HotelDetailToJson(HotelDetail instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address?.toJson(),
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services?.toJson(),
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) {
  return HotelAddress(
    country: json['country'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
    zipcode: json['zip_code'] as num,
    coords: json['coords'] == null
        ? null
        : Coordinates.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipcode,
      'coords': instance.coords?.toJson(),
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    lat: (json['lat'] as num)?.toDouble(),
    lan: (json['lan'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) {
  return HotelServices(
    free: (json['free'] as List)?.map((e) => e as String)?.toList(),
    paid: (json['paid'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };

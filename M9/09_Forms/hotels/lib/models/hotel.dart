import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({this.uuid, this.name, this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelDetail {
  final String uuid;
  final String name;
  final String poster;
  final HotelAddress address;
  final double price;
  final double rating;
  final HotelServices services;
  final List<String> photos;

  HotelDetail({
    this.uuid,
    this.name,
    this.poster,
    this.address,
    this.price,
    this.rating,
    this.services,
    this.photos,
  }) : super();

  factory HotelDetail.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress {
  final String country;
  final String street;
  final String city;
  @JsonKey(name: 'zip_code')
  final num zipcode;
  final Coordinates coords;

  HotelAddress({
    this.country,
    this.street,
    this.city,
    this.zipcode,
    this.coords,
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Coordinates {
  final double lat;
  final double lan;

  Coordinates({
    this.lat,
    this.lan,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServices {
  final List<String> free;
  final List<String> paid;

  HotelServices({
    this.free,
    this.paid,
  });

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}

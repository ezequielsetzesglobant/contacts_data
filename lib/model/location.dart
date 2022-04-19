import 'coordinates.dart';
import 'time_zone.dart';
import 'street.dart';

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timeZone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      timeZone: TimeZone.fromJson(json['timezone']),
    );
  }

  Street street;
  String city;
  String state;
  String country;
  var postcode;
  Coordinates coordinates;
  TimeZone timeZone;
}

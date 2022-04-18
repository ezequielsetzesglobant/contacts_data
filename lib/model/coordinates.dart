class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  String latitude;
  String longitude;
}

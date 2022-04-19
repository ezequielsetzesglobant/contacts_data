class TimeZone {
  TimeZone({
    required this.offset,
    required this.description,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      offset: json['offset'],
      description: json['description'],
    );
  }

  String offset;
  String description;
}

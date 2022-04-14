class Id {
  String name;
  String? value;

  Id({
    required this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'],
      value: json['value'],
    );
  }
}

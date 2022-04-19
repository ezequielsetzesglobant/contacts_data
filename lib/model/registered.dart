class Registered {
  Registered({
    required this.date,
    required this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) {
    return Registered(
      date: json['date'],
      age: json['age'],
    );
  }

  String date;
  int age;
}

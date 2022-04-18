class DateOfBirth {
  DateOfBirth({
    required this.date,
    required this.age,
  });

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(
      date: json['date'],
      age: json['age'],
    );
  }

  String date;
  int age;
}

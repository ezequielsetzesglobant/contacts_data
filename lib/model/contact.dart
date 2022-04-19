import 'id.dart';
import 'location.dart';
import 'name.dart';
import 'picture.dart';
import 'registered.dart';
import 'date_of_birth.dart';
import 'login.dart';

class Contact {
  Contact({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dateOfBirth,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nationality,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      login: Login.fromJson(json['login']),
      dateOfBirth: DateOfBirth.fromJson(json['dob']),
      registered: Registered.fromJson(json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      id: Id.fromJson(json['id']),
      picture: Picture.fromJson(json['picture']),
      nationality: json['nat'],
    );
  }

  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  DateOfBirth dateOfBirth;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nationality;

  String fullName() => '${name.first} ${name.last}';
}

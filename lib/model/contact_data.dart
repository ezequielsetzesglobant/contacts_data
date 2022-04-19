import 'contact.dart';
import 'info.dart';

class ContactData {
  ContactData({
    required this.results,
    required this.info,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) {
    var jsonList = json['results'] as List;
    List<Contact> contacts =
        jsonList.map((contact) => Contact.fromJson(contact)).toList();
    return ContactData(
      results: contacts,
      info: Info.fromJson(json['info']),
    );
  }

  List<Contact> results;
  Info info;
}

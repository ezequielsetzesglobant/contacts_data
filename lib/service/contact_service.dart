import 'dart:convert';
import 'dart:io';
import '../model/contact.dart';
import '../model/contact_data.dart';
import '../utils/constants.dart';
import 'interface/i_contact_service.dart';
import 'package:http/http.dart' as http;

class ContactService extends IContactService {
  var client = http.Client();

  @override
  Future<List<Contact>> getContacts() async {
    final response = await client.get(Uri.parse(Constants.url));
    if (response.statusCode == HttpStatus.ok) {
      return ContactData.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception(response.statusCode);
    }
  }
}

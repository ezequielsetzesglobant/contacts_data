import 'dart:convert';
import '../model/contact.dart';
import '../model/contact_data.dart';
import '../utils/constants.dart';
import 'service_interface_contact.dart';
import 'package:http/http.dart' as http;

class ServiceContact extends ServiceInterfaceContact {
  http.Client client = http.Client();

  @override
  Future<List<Contact>> getContacts() async {
    final response = await client.get(Uri.parse(Constants.url));
    if (response.statusCode == Constants.status) {
      return ContactData.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception(response.statusCode);
    }
  }
}

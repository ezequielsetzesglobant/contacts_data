import '../model/contact.dart';

abstract class ServiceInterfaceContact {
  Future<List<Contact>> getContacts();
}

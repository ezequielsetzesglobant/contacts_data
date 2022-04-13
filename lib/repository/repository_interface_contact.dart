import '../model/contact.dart';

abstract class RepositoryInterfaceContact {
  Future<List<Contact>> getContacts();
}

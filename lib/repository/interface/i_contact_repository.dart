import '../../model/contact.dart';

abstract class IContactRepository {
  Future<List<Contact>> getContacts();
}

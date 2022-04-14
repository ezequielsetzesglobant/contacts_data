import '../../model/contact.dart';

abstract class IContactService {
  Future<List<Contact>> getContacts();
}

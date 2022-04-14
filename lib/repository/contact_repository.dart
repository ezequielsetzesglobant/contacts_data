import 'package:contacts_data/model/contact.dart';
import '../service/interface/i_contact_service.dart';
import 'interface/i_contact_repository.dart';

class ContactRepository extends IContactRepository {
  final IContactService service;

  ContactRepository(
    this.service,
  );

  @override
  Future<List<Contact>> getContacts() => service.getContacts();
}

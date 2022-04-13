import 'package:contacts_data/model/contact.dart';
import '../service/service_interface_contact.dart';
import 'repository_interface_contact.dart';

class RepositoryContact extends RepositoryInterfaceContact {
  final ServiceInterfaceContact service;

  RepositoryContact(
    this.service,
  );

  @override
  Future<List<Contact>> getContacts() => service.getContacts();
}

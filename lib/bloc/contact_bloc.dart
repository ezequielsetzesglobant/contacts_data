import 'contact_interface_bloc.dart';
import '../model/contact.dart';
import '../repository/repository_interface_contact.dart';

class ContactBloc extends ContactInterfaceBloc {
  final RepositoryInterfaceContact repository;

  ContactBloc(
    this.repository,
  );

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {}

  @override
  Future<List<Contact>> getContacts() => repository.getContacts();
}

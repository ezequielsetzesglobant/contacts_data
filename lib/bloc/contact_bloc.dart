import 'interface/i_contact_bloc.dart';
import '../model/contact.dart';
import '../repository/interface/i_contact_repository.dart';

class ContactBloc extends IContactBloc {
  final IContactRepository repository;

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

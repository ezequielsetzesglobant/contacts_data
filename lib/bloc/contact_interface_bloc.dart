import '../model/contact.dart';
import 'bloc.dart';

abstract class ContactInterfaceBloc extends Bloc {
  Future<List<Contact>> getContacts();
}

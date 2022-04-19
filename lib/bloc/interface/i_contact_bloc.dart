import '../../model/contact.dart';
import 'bloc.dart';

abstract class IContactBloc extends Bloc {
  Future<List<Contact>> getContacts();
}

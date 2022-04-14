import 'package:contacts_data/bloc/contact_bloc.dart';
import 'package:contacts_data/model/contact.dart';
import 'package:contacts_data/repository/contact_repository.dart';
import 'package:contacts_data/service/contact_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'contact_bloc_test.mocks.dart';
import 'dart:convert';
import 'dart:io';

@GenerateMocks([
  ContactService,
])
void main() {
  late ContactBloc bloc;
  late ContactRepository repository;
  late MockServiceContact service;
  late Contact contact;

  setUp(() {
    service = MockServiceContact();
    repository = ContactRepository(service);
    bloc = ContactBloc(repository);
    File file = File(
        '/Users/ezequiel.setzes/StudioProjects/contacts_data/test/resources/json_test_data.json');
    contact = Contact.fromJson(json.decode(file.readAsStringSync()));
  });

  group('Check for existence and non-existence of widgets', () {
    test('Case not empty list', () async {
      when(service.getContacts()).thenAnswer(
        (_) async => [contact],
      );

      List<Contact> contactsList = await bloc.getContacts();

      expect(contactsList.length, 1);
      expect(contactsList.first, contact);
    });

    test('Case empty list', () async {
      when(service.getContacts()).thenAnswer(
        (_) async => [],
      );

      List<Contact> contactsList = await bloc.getContacts();

      expect(contactsList.length, 0);
    });
  });
}

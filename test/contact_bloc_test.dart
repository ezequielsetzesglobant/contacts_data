import 'package:contacts_data/bloc/contact_bloc.dart';
import 'package:contacts_data/model/contact.dart';
import 'package:contacts_data/model/coordinates.dart';
import 'package:contacts_data/model/dob.dart';
import 'package:contacts_data/model/id.dart';
import 'package:contacts_data/model/location.dart';
import 'package:contacts_data/model/login.dart';
import 'package:contacts_data/model/name.dart';
import 'package:contacts_data/model/picture.dart';
import 'package:contacts_data/model/registered.dart';
import 'package:contacts_data/model/street.dart';
import 'package:contacts_data/model/time_zone.dart';
import 'package:contacts_data/repository/repository_contact.dart';
import 'package:contacts_data/service/service_contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'contact_bloc_test.mocks.dart';

@GenerateMocks([
  ServiceContact,
])
void main() {
  late ContactBloc bloc;
  late RepositoryContact repository;
  late MockServiceContact service;
  late Contact contact;

  setUp(() {
    service = MockServiceContact();
    repository = RepositoryContact(service);
    bloc = ContactBloc(repository);
    contact = Contact(
      gender: 'gender',
      name: Name(
        title: 'title',
        first: 'first',
        last: 'last',
      ),
      location: Location(
        street: Street(
          number: 1,
          name: 'name',
        ),
        city: 'city',
        state: 'state',
        country: 'country',
        postcode: 1,
        coordinates: Coordinates(
          latitude: 'latitude',
          longitude: 'longitude',
        ),
        timeZone: TimeZone(
          offset: 'offset',
          description: 'description',
        ),
      ),
      email: 'email',
      login: Login(
        uuid: 'uuid',
        userName: 'userName',
        password: 'password',
        salt: 'salt',
        md5: 'md5',
        sha1: 'sha1',
        sha256: 'sha256',
      ),
      dob: Dob(
        date: 'date',
        age: 1,
      ),
      registered: Registered(
        date: 'date',
        age: 1,
      ),
      phone: 'phone',
      cell: 'cell',
      id: Id(
        name: 'name',
        value: 'value',
      ),
      picture: Picture(
        large: 'large',
        medium: 'medium',
        thumbnail: 'thumbnail',
      ),
      nat: 'nat',
    );
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

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
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contacts_data/ui/home_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  ContactBloc,
])
void main() {
  late MockContactBloc bloc;
  late Contact contact;

  setUp(() {
    bloc = MockContactBloc();
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
    testWidgets('Case not empty list', (WidgetTester tester) async {
      when(bloc.getContacts()).thenAnswer(
        (_) async => [contact],
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: HomePage(
              bloc,
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(ListTile),
          ),
          findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(ListTile),
          ),
          findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Card),
          ),
          findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(SizedBox),
          ),
          findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Center),
          ),
          findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Text),
          ),
          findsOneWidget);
      expect(find.text('first last'), findsOneWidget);
    });

    testWidgets('Case empty list', (WidgetTester tester) async {
      when(bloc.getContacts()).thenAnswer(
        (_) async => [],
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: HomePage(
              bloc,
            ),
          ),
        );
      });
      await tester.pump();

      expect(find.byType(ListTile), findsNothing);
      expect(find.byType(Card), findsNothing);
      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(Center), findsNothing);
      expect(find.byType(Text), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(ListTile),
          ),
          findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(ListTile),
          ),
          findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Card),
          ),
          findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(SizedBox),
          ),
          findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Center),
          ),
          findsNothing);
      expect(
          find.descendant(
            of: find.byType(Scaffold),
            matching: find.byType(Text),
          ),
          findsNothing);
      expect(find.text('first last'), findsNothing);
    });
  });
}

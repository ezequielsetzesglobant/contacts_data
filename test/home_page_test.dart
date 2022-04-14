import 'package:contacts_data/bloc/contact_bloc.dart';
import 'package:contacts_data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contacts_data/ui/home_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_test.mocks.dart';
import 'dart:convert';
import 'dart:io';

@GenerateMocks([
  ContactBloc,
])
void main() {
  late MockContactBloc bloc;
  late Contact contact;

  setUp(() {
    bloc = MockContactBloc();
    File file = File(
        '/Users/ezequiel.setzes/StudioProjects/contacts_data/test/resources/json_test_data.json');
    contact = Contact.fromJson(json.decode(file.readAsStringSync()));
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
      expect(find.byType(Text), findsNWidgets(2));
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
          findsNWidgets(2));
      expect(find.text('Zoey Castro'), findsOneWidget);
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
      expect(find.byType(Text), findsOneWidget);
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
          findsOneWidget);
      expect(find.text('Zoey Castro'), findsNothing);
    });
  });
}

import 'package:contacts_data/model/contact.dart';
import 'package:contacts_data/ui/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  late Contact contact;

  setUp(() {
    File file = File(
        '/Users/ezequiel.setzes/StudioProjects/contacts_data/test/resources/json_test_data.json');
    contact = Contact.fromJson(json.decode(file.readAsStringSync()));
  });

  testWidgets('Check for existence of widgets', (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: DetailsPage(
            image: contact.picture.large,
            fullName: contact.fullName(),
            email: contact.email,
            phone: contact.phone,
            cell: contact.cell,
            age: '${contact.dateOfBirth.age}',
            nationality: contact.nationality,
          ),
        ),
      ),
    );

    expect(find.byType(FadeInImage), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(7));
    expect(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(FadeInImage),
        ),
        findsOneWidget);
    expect(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(Text),
        ),
        findsNWidgets(7));
  });
}

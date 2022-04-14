import 'package:contacts_data/ui/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Check for existence of widgets', (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(const MaterialApp(
        home: DetailsPage(
          image: 'https://randomuser.me/api/portraits/women/14.jpg',
          fullName: 'Zoey Castro',
          email: 'zoey.castro@example.com',
          phone: '02-5055-3217',
          cell: '0437-682-616',
          age: '29',
          nationality: 'AU',
        ),
      )),
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

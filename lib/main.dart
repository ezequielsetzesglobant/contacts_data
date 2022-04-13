import 'repository/repository_contact.dart';
import 'service/service_contact.dart';
import 'package:flutter/material.dart';
import 'bloc/contact_bloc.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(ContactBloc(RepositoryContact(ServiceContact()))),
    );
  }
}

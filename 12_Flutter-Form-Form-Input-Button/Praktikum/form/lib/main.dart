import 'package:flutter/material.dart';
import 'contact_page.dart';
import 'new_contact_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contacts App',
    initialRoute: '/',
    routes: {
      '/': (context) => NewContactPage(),
      '/contact': (context) => ContactPage(),
    },
  ));
}

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: const Center(
        child: Text(
          'This is the Contact Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Contacts App',
    home: ContactPage(),
  ));
}

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String imageUrl;

  const NewPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Detail Image',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

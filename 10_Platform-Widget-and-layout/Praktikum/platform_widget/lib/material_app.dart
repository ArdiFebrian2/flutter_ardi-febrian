import 'package:flutter/material.dart';
import 'material_page.dart'; // Menggunakan relative path jika file material_page.dart berada di direktori yang sama dengan main.dart

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Anda harus menambahkan parameter context di dalam method build
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // Tema Gelap keseluruhan
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

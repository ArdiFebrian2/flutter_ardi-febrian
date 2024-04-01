import 'package:flutter/material.dart';
import 'date_color_picker.dart'; // Import file date_color_picker.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Color Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDatePickerPage(), // Gunakan MyDatePickerPage di sini
    );
  }
}

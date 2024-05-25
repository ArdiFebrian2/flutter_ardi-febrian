import 'package:flutter/material.dart';
import 'package:smartphone_recommendation/screens/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFBC0C24)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

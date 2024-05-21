import 'package:flutter/material.dart';
import 'package:prioritas2/contact_page.dart';
import 'package:prioritas2/gallery_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assets',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/contact': (context) =>
            const ContactPage(), // untuk ke halaman Contact
        '/galeri': (context) => const GalleryPage(), // untuk ke halaman Galeri
      },
      home: const HomePage(),
    );
  }
}

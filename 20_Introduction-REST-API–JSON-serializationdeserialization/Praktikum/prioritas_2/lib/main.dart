import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prioritas2 ardi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String svgData = ''; // Inisialisasi dengan string kosong

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.dicebear.com/7.x/pixel-art/svg?seed=Jane'));

      if (response.statusCode == 200) {
        setState(() {
          svgData = response.body;
        });
      } else {
        throw Exception('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear Image Viewer'),
      ),
      body: Center(
        child: svgData.isNotEmpty
            ? SvgPicture.string(
                svgData,
                height: 500.0,
                width: 500.0,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

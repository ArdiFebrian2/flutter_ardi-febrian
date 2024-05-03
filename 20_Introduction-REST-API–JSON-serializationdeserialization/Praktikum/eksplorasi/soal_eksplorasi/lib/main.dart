import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = '';
  TextEditingController textController = TextEditingController();
  Key imageKey = UniqueKey(); // Add a key for the Image widget

  Future<void> fetchImage(String text) async {
    final response = await http
        .get(Uri.parse('https://api.dicebear.com/7.x/initials/svg?seed=$text'));
    if (response.statusCode == 200) {
      setState(() {
        imageUrl =
            'data:image/svg+xml;base64,' + base64Encode(response.bodyBytes);
        imageKey = UniqueKey(); // Update the key to force widget rebuild
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear Image Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageUrl.isNotEmpty
                ? SvgPicture.memory(
                    base64Decode(imageUrl
                        .substring('data:image/svg+xml;base64,'.length)),
                    key: imageKey, // Use the key here
                    width: 200,
                    height: 200,
                  )
                : Container(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: 'Enter text'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  fetchImage(textController.text);
                } else {
                  // Handle empty text input
                  // You can show a dialog or a message to inform the user.
                }
              },
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}

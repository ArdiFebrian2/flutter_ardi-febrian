import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark, // Tema hitam
      ),
      home: CupertinoPage(),
    );
  }
}

class CupertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoApp'),
      ),
      child: Center(
        child: Text(
          'This Is CupertinoApp',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

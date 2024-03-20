import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text("Home Page"),
            ),
            ListTile(
              title: Text("About Page"),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("This is Material"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

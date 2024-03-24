import 'package:flutter/material.dart';
import 'material_page.dart'; // Assuming material_page.dart is in the same directory as main.dart

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You need to add the context parameter inside the build method
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // Dark Theme overall
        scaffoldBackgroundColor: Colors
            .white, // This should be the background color for the scaffold
        appBarTheme: AppBarTheme(
          color: Colors.white, // Changed to white color
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            // Changed to blue color for the title
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Color(0xFF00A8E8), // Primary color
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFA8E800), // Secondary color for FAB
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF00A8E8), // Selected item color
          unselectedItemColor: Colors.black, // Unselected item color (black)
          backgroundColor:
              Colors.white, // Background color for the bottom navigation bar
        ),
      ),
      home: HomePage(),
    );
  }
}

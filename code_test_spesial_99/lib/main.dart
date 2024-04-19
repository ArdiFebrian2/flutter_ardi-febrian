// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';
import 'views/shop_page.dart';
import 'views/profile_page.dart';
import 'viewmodels/user_viewmodel.dart';
import 'viewmodels/current_index_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => CurrentIndexViewModel()),
      ],
      child: MaterialApp(
        title: 'Code Test Spesial 99',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ShopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Code Test Spesial 99'),
      ),
      body: Consumer<CurrentIndexViewModel>(
        builder: (context, currentIndexViewModel, child) {
          return _widgetOptions[currentIndexViewModel.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<CurrentIndexViewModel>(
        builder: (context, currentIndexViewModel, child) {
          return BottomNavigationBar(
            currentIndex: currentIndexViewModel.currentIndex,
            onTap: (index) {
              currentIndexViewModel.updateIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}

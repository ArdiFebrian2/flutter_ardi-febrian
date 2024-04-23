import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/models/db_manager.dart';
import 'package:storage/screens/login_screen.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management',
        routes: {
          '/': (context) => const LoginScreen(),
          '/taskScreen': (context) => const TaskScreen(),
        },
      ),
    );
  }
}

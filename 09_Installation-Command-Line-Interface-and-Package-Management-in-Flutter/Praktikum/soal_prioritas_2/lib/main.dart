import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        // useMaterial3: true, // Gunakan jika Anda menginginkan tema Material 3
      ),
      home: const MyHomePage(title: 'Hallo Alterra'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Mengubah warna AppBar menjadi oranye
        title: Text(
          widget.title,
          textAlign: TextAlign.center, // Posisikan judul ke tengah
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Tindakan ketika ikon profil diklik
              print('Tombol Profil Diklik');
            },
          ),
        ],
      ),
      backgroundColor:
          Colors.white, // Memberi latar belakang putih pada Scaffold
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Nama Saya Adalah Ardi Febrian',
            ),
          ],
        ),
      ),
    );
  }
}

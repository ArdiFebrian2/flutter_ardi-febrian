import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Konstruktor MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange), // Mengatur skema warna aplikasi
        useMaterial3: true, // Menggunakan Material 3
      ),
      home: const MyHomePage(title: 'Introduction flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title})
      : super(key: key); // Konstruktor MyHomePage

  final String title; // Judul halaman

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); // Membuat state MyHomePage
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Variabel untuk menyimpan jumlah

  void _incrementCounter() {
    // Metode untuk menambah jumlah
    setState(() {
      _counter++;
    });
  }

  /// Metode untuk mengurangi jumlah
  ///
  /// Jika jumlah lebih dari 0, maka jumlahnya dikurangi 1
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, // Warna latar belakang app bar
        title: Text(
          widget.title,
          textAlign: TextAlign.center, // Teks di tengah app bar
        ),
        centerTitle: true, // Judul di tengah app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:', // Teks informasi
            ),
            Text(
              '$_counter', // Menampilkan jumlah
              style: Theme.of(context)
                  .textTheme
                  .headline6, // Gaya teks berdasarkan tema
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter, // Fungsi ketika tombol diklik
            tooltip: 'Decrement', // Info tooltip
            child: const Icon(Icons.remove), // Icon tombol
          ),
          const SizedBox(width: 16), // Jarak antara tombol
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

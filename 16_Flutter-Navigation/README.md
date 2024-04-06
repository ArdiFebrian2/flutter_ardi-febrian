Flutter Navigation

1.Apa itu Navigasi:
Navigasi dalam Flutter merujuk pada proses perpindahan antara layar atau halaman dalam sebuah aplikasi. Ini memungkinkan pengguna untuk berinteraksi dengan berbagai fitur dan konten yang disediakan oleh aplikasi dengan lancar dan intuitif.

2.Navigasi Dasar:
-Navigasi dasar dalam Flutter melibatkan penggunaan widget Navigator untuk mengelola tumpukan (stack) halaman.
-Metode Navigator.push() digunakan untuk menambahkan halaman baru ke tumpukan dan beralih ke halaman tersebut.
-Metode Navigator.pop() digunakan untuk menghapus halaman teratas dari tumpukan dan kembali ke halaman sebelumnya.
Contohnya:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
        
            Navigator.pop(context);
          },
          child: Text('Go back to First Screen'),
        ),
      ),
    );
  }
}
```


3.Navigasi dengan Named Routes:
-Navigasi dengan named routes mengacu pada pendefinisian rute-nama (named routes) untuk setiap halaman dalam aplikasi.
-Rute-nama didefinisikan dalam objek MaterialApp menggunakan properti routes.
-Untuk berpindah antar halaman, dapat menggunakan metode Navigator.pushNamed() dengan menyebutkan nama rute yang diinginkan.
-Keuntungan utama dari navigasi dengan named routes adalah kejelasan dan keamanan kode, serta kemudahan dalam memperbarui dan mengelola rute aplikasi.
Contohnya:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke SecondScreen menggunakan named route
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Kembali ke FirstScreen menggunakan Navigator.pop()
            Navigator.pop(context);
          },
          child: Text('Go back to First Screen'),
        ),
      ),
    );
  }
}
```
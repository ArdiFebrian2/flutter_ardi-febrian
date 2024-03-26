Fitur Utama Flutter Layout:

1.Widget-Widget:
Flutter menggunakan konsep "widget" sebagai bangunannya. Widget adalah potongan-potongan kecil dari antarmuka pengguna yang bisa dilihat dan diberi tindakan oleh pengguna.
Terdapat berbagai jenis widget, seperti StatelessWidget (widget yang tidak berubah) dan StatefulWidget (widget yang dapat berubah).

2.Hierarchical Structure:
Tata letak dalam Flutter dibangun dengan menyusun widget-widget secara hierarkis. Ini memungkinkan untuk membuat tata letak yang kompleks dengan menyusun widget-widget ke dalam widget-widget lainnya.

3.Responsif dan Fleksibel:
Flutter menyediakan widget-widget yang memungkinkan tata letak responsif dan fleksibel. Ini memungkinkan aplikasi Flutter untuk menyesuaikan diri dengan berbagai ukuran layar dan orientasi perangkat.

4.Hot Reload:
Fitur Hot Reload di Flutter memungkinkan pengembang untuk melihat perubahan langsung dalam aplikasi tanpa perlu memulai ulang atau kehilangan status aplikasi.

Berikut adalah contoh kode sederhana untuk membuat tata letak dasar dengan Flutter:
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Layout'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Press Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
Kode di atas akan membuat aplikasi Flutter sederhana dengan tata letak sebagai berikut:
-Di tengah layar terdapat teks "Hello, Flutter!" dengan gaya huruf tertentu.
-Di bawah teks tersebut terdapat tombol bertuliskan "Press Me".
-Ketika tombol ditekan, fungsi onPressed yang ditetapkan akan dijalankan.
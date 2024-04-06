ASSETS

1.Penggunaan Assets:
Aset dalam Flutter merujuk pada semua file yang diperlukan oleh aplikasi, seperti gambar, font, ikon, dan lainnya. Dalam file pubspec.yaml, kita mendefinisikan aset-aset yang dibutuhkan oleh aplikasi. Misalnya, jika kita memiliki folder assets/images/ dan assets/fonts/, kita dapat mengidentifikasi kedua folder tersebut sebagai aset dalam pubspec.yaml.
Contohnya:
```dart
flutter:
  assets:
    - assets/images/
    - assets/fonts/
```

2.Penggunaan Gambar:
Gambar adalah aset visual yang penting dalam pengembangan aplikasi Flutter. Mereka termasuk grafis, foto, ikon, dan lainnya, yang diperlukan untuk memperindah antarmuka pengguna (UI) dan meningkatkan pengalaman pengguna. Dalam Flutter, gambar dapat dimuat menggunakan widget Image.asset() atau Image.network() tergantung dari mana gambar itu berasal, apakah dari sumber lokal atau dari internet.
Contohnya:
```dart
import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Example')),
      body: Center(
        child: Image.asset('assets/images/flutter_logo.png'),
      ),
    );
  }
}
```

3.Penggunaan Vector:
Vector adalah format grafis yang menggambarkan gambar dalam bentuk garis, kurva, dan bentuk geometris lainnya. Dalam Flutter, kita dapat menggunakan gambar vector dengan format SVG menggunakan paket flutter_svg. Penggunaan vektor memungkinkan kita membuat grafik dan ilustrasi yang skalabel tanpa kehilangan kualitas, sehingga sering digunakan untuk ikon aplikasi, grafik UI, dan elemen desain lainnya.
Contohnya:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vector Example')),
      body: Center(
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/32645/hotel.svg',
          placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),
          width: 300,
        ),
      ),
    );
  }
}
```

4.Penggunaan Font:
Font digunakan untuk mengatur tampilan teks dalam aplikasi Flutter. Flutter mendukung berbagai jenis font, termasuk font kustom yang diimpor secara langsung atau font dari paket seperti google_fonts. Font dapat diatur untuk mengubah gaya, ukuran, dan warna teks sesuai kebutuhan aplikasi, dan dapat diterapkan menggunakan widget Text dengan properti style yang sesuai dengan font yang diinginkan.
Contohnya:
```dart
import 'package:flutter/material.dart';

class CustomFontExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Font Example')),
      body: Center(
        child: Text(
          'Custom Font Example',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24.0),
        ),
      ),
    );
  }
}
```
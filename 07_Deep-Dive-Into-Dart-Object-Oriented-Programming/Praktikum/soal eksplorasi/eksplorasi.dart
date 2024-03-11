import 'dart:math'; // Impor pustaka matematika untuk menggunakan fungsi sqrt() dan pi

// Interface BangunDatar
abstract class BangunDatar {
  double getArea(); // Metode untuk mengembalikan luas bangun datar
  double getPerimeter(); // Metode untuk mengembalikan keliling bangun datar
}

// Class Persegi implementasi dari BangunDatar
class Persegi implements BangunDatar {
  final double sisi; // Panjang sisi persegi

  // Konstruktor Persegi
  Persegi({required this.sisi});

  // Metode untuk menghitung luas persegi
  @override
  double getArea() => sisi * sisi;

  // Metode untuk menghitung keliling persegi
  @override
  double getPerimeter() => 4 * sisi;

  // Representasi teks dari objek Persegi
  @override
  String toString() => 'Persegi dengan sisi $sisi';
}

// Class Segitiga implementasi dari BangunDatar
class Segitiga implements BangunDatar {
  final double alas; // Panjang alas segitiga
  final double tinggi; // Tinggi segitiga

  // Konstruktor Segitiga
  Segitiga({required this.alas, required this.tinggi});

  // Metode untuk menghitung luas segitiga
  @override
  double getArea() => (alas * tinggi) / 2;

  // Metode untuk menghitung keliling segitiga menggunakan rumus Pythagoras
  @override
  double getPerimeter() => alas + tinggi + sqrt(alas * alas + tinggi * tinggi);

  // Representasi teks dari objek Segitiga
  @override
  String toString() => 'Segitiga dengan alas $alas dan tinggi $tinggi';
}

// Class Lingkaran implementasi dari BangunDatar
class Lingkaran implements BangunDatar {
  final double jariJari; // Jari-jari lingkaran

  // Konstruktor Lingkaran
  Lingkaran({required this.jariJari});

  // Metode untuk menghitung luas lingkaran
  @override
  double getArea() => pi * jariJari * jariJari;

  // Metode untuk menghitung keliling lingkaran
  @override
  double getPerimeter() => 2 * pi * jariJari;

  // Representasi teks dari objek Lingkaran
  @override
  String toString() => 'Lingkaran dengan jari-jari $jariJari';
}

// Main Function
void main() {
  // Membuat objek persegi, segitiga, dan lingkaran
  final persegi = Persegi(sisi: 5);
  final segitiga = Segitiga(alas: 4, tinggi: 3);
  final lingkaran = Lingkaran(jariJari: 7);

  // Menampilkan informasi persegi
  print('Persegi:');
  print('Luas: ${persegi.getArea()}');
  print('Keliling: ${persegi.getPerimeter()}');

  // Menampilkan informasi segitiga
  print('\nSegitiga:');
  print('Luas: ${segitiga.getArea()}');
  print('Keliling: ${segitiga.getPerimeter()}');

  // Menampilkan informasi lingkaran
  print('\nLingkaran:');
  print('Luas: ${lingkaran.getArea()}');
  print('Keliling: ${lingkaran.getPerimeter()}');
}

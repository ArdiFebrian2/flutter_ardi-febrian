import 'dart:math'; // Import library untuk menggunakan nilai Pi

class Lingkaran {
  double jariJari; // Variabel untuk menyimpan jari-jari lingkaran

  // Konstruktor untuk menginisialisasi jari-jari lingkaran
  Lingkaran(this.jariJari);

  // Metode untuk menghitung luas lingkaran
  double hitungLuas() {
    return pi * pow(jariJari, 2); // Rumus luas lingkaran: Pi * r^2
  }

  // Metode untuk menghitung keliling lingkaran
  double hitungKeliling() {
    return 2 * pi * jariJari; // Rumus keliling lingkaran: 2 * Pi * r
  }
}

void main() {
  // Membuat objek untuk lingkaran dengan jari-jari 7.0
  Lingkaran lingkaran = Lingkaran(7.0);

  // Menampilkan luas dan keliling lingkaran
  print('Luas Lingkaran: ${lingkaran.hitungLuas()}');
  print('Keliling Lingkaran: ${lingkaran.hitungKeliling()}');
}

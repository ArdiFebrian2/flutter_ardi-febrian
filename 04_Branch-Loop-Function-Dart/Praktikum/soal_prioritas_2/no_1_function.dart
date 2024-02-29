import 'dart:math';

// Fungsi untuk menghitung luas lingkaran
double hitungLuasLingkaran(double radius) {
  return pi * radius * radius;
}

void main() {
  double radius = 5.0; // contoh nilai radius

  // Memanggil fungsi hitungLuasLingkaran
  double luas = hitungLuasLingkaran(radius);

  // Menampilkan hasil perhitungan luas lingkaran
  print('Luas lingkaran dengan radius $radius adalah $luas');
}

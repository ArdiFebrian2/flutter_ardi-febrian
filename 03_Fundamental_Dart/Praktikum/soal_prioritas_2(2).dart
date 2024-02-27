import 'dart:math'; // Import library untuk menggunakan nilai Pi

class Tabung {
  double jariJari; // Variabel untuk menyimpan jari-jari tabung
  double tinggi; // Variabel untuk menyimpan tinggi tabung

  // Konstruktor untuk menginisialisasi jari-jari dan tinggi tabung
  Tabung(this.jariJari, this.tinggi);

  // Metode untuk menghitung volume tabung
  double hitungVolume() {
    return pi *
        pow(jariJari, 2) *
        tinggi; // Rumus volume tabung: π * r^2 * tinggi
  }
}

void main() {
  // Membuat objek untuk tabung dengan jari-jari 5.0 dan tinggi 10.0
  Tabung tabung = Tabung(5.0, 10.0);

  // Menampilkan volume tabung
  print('Volume Tabung: ${tabung.hitungVolume()}');
}

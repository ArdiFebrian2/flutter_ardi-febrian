import 'dart:io';

void main() {
  int tinggi = 6; // Tinggi jam pasir

  // Bagian atas jam pasir
  for (int i = 0; i < tinggi; i++) {
    // Cetak spasi di awal baris
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    // Cetak bintang
    for (int k = 0; k < tinggi - i; k++) {
      stdout.write("0 ");
    }
    // Pindah ke baris baru
    print("");
  }

  // Bagian bawah jam pasir
  for (int i = tinggi - 2; i >= 0; i--) {
    // Cetak spasi di awal baris
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    // Cetak bintang
    for (int k = 0; k < tinggi - i; k++) {
      stdout.write("0 ");
    }
    // Pindah ke baris baru
    print("");
  }
}

// Import pustaka dart:io untuk menggunakan stdout
import 'dart:io';

// Fungsi untuk mencetak tabel perkalian dari 1 hingga n
void printMultiplicationTable(int n) {
  // Iterasi untuk setiap baris tabel
  for (int i = 1; i <= n; i++) {
    // Iterasi untuk setiap kolom dalam baris
    for (int j = 1; j <= n; j++) {
      // Menggunakan stdout.write untuk menulis hasil perkalian tanpa karakter baru
      stdout.write("${i * j} ");
    }
    // Setelah selesai mencetak baris, mencetak karakter baru agar baris baru dimulai
    print("");
  }
}

void main() {
  // Nilai n yang akan digunakan untuk membuat tabel perkalian
  int n = 9;

  // Memanggil fungsi untuk mencetak tabel perkalian dengan n sebagai argumen
  printMultiplicationTable(n);
}

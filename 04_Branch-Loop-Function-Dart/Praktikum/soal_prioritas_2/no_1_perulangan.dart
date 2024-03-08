import 'dart:io';

//digunakan untuk memberikan akses kepada fungsi
void main() {
  const rows = 8;

  for (int i = 0; i < rows; i++) {
    // Mencetak spasi terdepan
    for (int j = 0; j < rows - i - 1; j++) {
      stdout.write(" ");
    }

    // Mencetak "*".
    for (int j = 0; j < 2 * i + 1; j++) {
      stdout.write("*");
    }

    // Pindah ke baris berikutnya
    stdout.write("\n");
  }
}

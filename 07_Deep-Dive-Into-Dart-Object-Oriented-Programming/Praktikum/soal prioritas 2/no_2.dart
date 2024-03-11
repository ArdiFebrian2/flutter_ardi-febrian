// Kelas Matematika untuk melakukan operasi matematika
class Matematika {
  // Metode untuk mencari kelipatan persekutuan terkecil (GCD) dari dua bilangan
  int kelipatanPersekutuanTerkecil(int x, int y) {
    // Menentukan bilangan terkecil antara x dan y
    int smaller = x < y ? x : y;
    // Mencari kelipatan persekutuan terkecil dengan iterasi
    for (int i = 1; i <= smaller; i++) {
      if (x % i == 0 && y % i == 0) {
        return i;
      }
    }
    return 1; // Mengembalikan 1 jika tidak ditemukan kelipatan persekutuan
  }

  // Metode untuk mencari faktor persekutuan terbesar (LCM) dari dua bilangan
  int faktorPersekutuanTerbesar(int x, int y) {
    // Menggunakan rumus: LCM = (x * y) / GCD(x, y)
    return (x * y) ~/ kelipatanPersekutuanTerkecil(x, y);
  }

  // Metode untuk melakukan operasi tambahan
  int operasiTambahan(int x, int y) {
    // Contoh operasi tambahan, misalnya penjumlahan
    return x + y;
  }
}

void main() {
  // Membuat objek Matematika
  var matematika = Matematika();
  // Menentukan dua bilangan
  var x = 12;
  var y = 18;

  // Menghitung kelipatan persekutuan terkecil (GCD)
  var gcd = matematika.kelipatanPersekutuanTerkecil(x, y);
  // Menghitung faktor persekutuan terbesar (LCM)
  var lcm = matematika.faktorPersekutuanTerbesar(x, y);

  // Menggunakan metode tambahan untuk contoh operasi tambahan
  var hasilOperasiTambahan = matematika.operasiTambahan(x, y);

  // Menampilkan hasil kelipatan persekutuan terkecil dan faktor persekutuan terbesar
  print('Kelipatan Persekutuan Terkecil dari $x dan $y adalah: $gcd');
  print('Faktor Persekutuan Terbesar dari $x dan $y adalah: $lcm');

  // Menampilkan hasil operasi tambahan
  print('Hasil operasi tambahan: $hasilOperasiTambahan');
}

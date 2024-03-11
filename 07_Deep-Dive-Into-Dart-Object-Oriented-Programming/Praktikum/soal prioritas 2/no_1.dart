class Matematika {
  // Method untuk mencari kelipatan persekutuan terkecil (GCD) dari dua bilangan
  int kelipatanPersekutuanTerkecil(int x, int y) {
    /*
     Returns the Greatest Common Divisor (GCD) of two numbers x and y.
    */
    // Menentukan bilangan terkecil antara x dan y
    int smaller = x < y ? x : y;
    // Iterasi untuk mencari kelipatan persekutuan terkecil
    for (int i = 1; i <= smaller; i++) {
      // Jika i adalah kelipatan persekutuan dari x dan y
      if (x % i == 0 && y % i == 0) {
        // Mengembalikan nilai kelipatan persekutuan terkecil
        return i;
      }
    }
    // Mengembalikan 1 jika tidak ada kelipatan persekutuan lain yang ditemukan
    return 1;
  }

  // Method untuk mencari faktor persekutuan terbesar (LCM) dari dua bilangan
  int faktorPersekutuanTerbesar(int x, int y) {
    /*
     Returns the Least Common Multiple (LCM) of two numbers x and y.
    */
    // Menggunakan rumus: LCM = (x * y) / GCD(x, y)
    return (x * y) ~/ kelipatanPersekutuanTerkecil(x, y);
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

  // Menampilkan hasil kelipatan persekutuan terkecil dan faktor persekutuan terbesar
  print('Kelipatan Persekutuan Terkecil dari $x dan $y adalah: $gcd');
  print('Faktor Persekutuan Terbesar dari $x dan $y adalah: $lcm');
}

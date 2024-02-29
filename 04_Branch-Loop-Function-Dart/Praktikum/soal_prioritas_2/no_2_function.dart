// Import library dart:core untuk mengakses tipe data BigInt yang diperlukan
import 'dart:core';

// Fungsi untuk menghitung faktorial dari sebuah bilangan bulat n
// Parameter: n (integer) - bilangan bulat yang akan dihitung faktorialnya
// Return: BigInt - nilai faktorial dari n
BigInt faktorial(int n) {
  // Jika n adalah 0 atau 1, maka hasil faktorialnya adalah 1
  if (n == 0 || n == 1) {
    return BigInt.from(1);
  } else {
    // Jika n lebih dari 1, lakukan perhitungan faktorial
    BigInt result = BigInt.from(1);
    for (int i = 2; i <= n; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }
}

// Fungsi utama (main)
void main() {
  // List nilai yang akan dihitung faktorialnya
  List<int> values = [10, 40, 50];

  // Iterasi melalui setiap nilai dalam list values
  for (int value in values) {
    // Hitung faktorial dari nilai saat ini
    BigInt hasil = faktorial(value);
    // Cetak hasil faktorial ke layar
    print("Faktorial dari $value adalah $hasil");
  }
}

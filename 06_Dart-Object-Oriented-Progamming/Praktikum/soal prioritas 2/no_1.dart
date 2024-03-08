class Calculator {
  // Method untuk melakukan penjumlahan dua bilangan
  double penjumlahan(double a, double b) {
    return a + b;
  }

  // Method untuk melakukan pengurangan dua bilangan
  double pengurangan(double a, double b) {
    return a - b;
  }

  // Method untuk melakukan perkalian dua bilangan
  double perkalian(double a, double b) {
    return a * b;
  }

  // Method untuk melakukan pembagian dua bilangan
  double pembagian(double a, double b) {
    if (b != 0) {
      // Memeriksa apakah pembagi tidak nol
      return a / b;
    } else {
      throw ArgumentError('Pembagian oleh nol tidak diperbolehkan.');
    }
  }
}

void main() {
  var calculator = Calculator();

  // Contoh penggunaan method pada kelas Calculator
  print('Penjumlahan: ${calculator.penjumlahan(10, 5)}');
  print('Pengurangan: ${calculator.pengurangan(10, 5)}');
  print('Perkalian: ${calculator.perkalian(10, 5)}');

  try {
    print('Pembagian: ${calculator.pembagian(10, 5)}');
    print(
        'Pembagian: ${calculator.pembagian(10, 0)}'); // Ini akan melempar exception
  } catch (e) {
    print('Error: $e');
  }
}

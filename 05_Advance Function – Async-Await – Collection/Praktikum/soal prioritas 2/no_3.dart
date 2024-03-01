import 'dart:async';

Future<int> factorial(int n) async {
  if (n == 0) {
    return 1;
  } else {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}

void main() async {
  int input = 5;

  // Menggunakan await untuk menunggu hasil perhitungan faktorial
  int hasilFaktorial = await factorial(input);

  print('Faktorial dari $input adalah $hasilFaktorial');
}

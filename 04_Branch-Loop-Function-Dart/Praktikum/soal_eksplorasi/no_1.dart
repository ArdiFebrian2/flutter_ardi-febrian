// Fungsi untuk mengecek apakah sebuah bilangan adalah bilangan prima atau bukan
bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int bilangan1 = 23;
  int bilangan2 = 12;

  // Memeriksa apakah bilangan1 adalah bilangan prima
  if (isPrime(bilangan1)) {
    print("$bilangan1 adalah bilangan prima");
  } else {
    print("$bilangan1 bukan bilangan prima");
  }

  // Memeriksa apakah bilangan2 adalah bilangan prima
  if (isPrime(bilangan2)) {
    print("$bilangan2 adalah bilangan prima");
  } else {
    print("$bilangan2 bukan bilangan prima");
  }
}

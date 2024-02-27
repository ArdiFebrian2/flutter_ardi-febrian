void main() {
  // Input kata yang akan dicek
  String kata1 = 'kasur rusak';
  String kata2 = 'mobil balap';

  // Memeriksa apakah kata1 merupakan palindrom atau bukan
  if (isPalindrome(kata1)) {
    print('Output Kata 1: palindrom');
  } else {
    print('Output Kata 1: bukan palindrom');
  }

  // Memeriksa apakah kata2 merupakan palindrom atau bukan
  if (isPalindrome(kata2)) {
    print('Output Kata 2: palindrom');
  } else {
    print('Output Kata 2: bukan palindrom');
  }
}

// Fungsi untuk mengecek apakah sebuah kata merupakan palindrom atau tidak
bool isPalindrome(String word) {
  // Menghapus spasi dan mengubah menjadi huruf kecil
  word = word.replaceAll(' ', '').toLowerCase();
  // Menggunakan metode untuk membalikkan kata
  String reversedWord = word.split('').reversed.join('');
  // Memeriksa apakah kata asli sama dengan kata yang dibalik
  return word == reversedWord;
}

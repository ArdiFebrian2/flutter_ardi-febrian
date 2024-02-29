void main() {
  List<String> fruits = [
    'Apple',
    'Banana',
    'Avocado',
    'Cherry',
    'Mango',
    'Apricot',
    'Blueberry',
    'Acerola',
    'Grape',
    'Almond'
  ];

  // Gunakan for loop in untuk iterasi setiap elemen dalam list
  for (String fruit in fruits) {
    // Gunakan startsWith untuk memeriksa apakah elemen diawali dengan karakter 'A'
    if (fruit.startsWith('A')) {
      print(fruit);
    }
  }
}

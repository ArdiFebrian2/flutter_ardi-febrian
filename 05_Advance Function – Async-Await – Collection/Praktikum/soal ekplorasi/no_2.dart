void main() {
  // List sampel data
  final data = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  // Inisialisasi map untuk menyimpan frekuensi
  final Map<String, int> frequencyMap = {};

  // Hitung frekuensi setiap data
  for (String element in data) {
    // Increment nilai frekuensi untuk element
    frequencyMap[element] =
        frequencyMap.containsKey(element) ? frequencyMap[element]! + 1 : 1;
  }

  // Cetak frekuensi setiap data
  for (final entry in frequencyMap.entries) {
    print('${entry.key}: ${entry.value}');
  }
}

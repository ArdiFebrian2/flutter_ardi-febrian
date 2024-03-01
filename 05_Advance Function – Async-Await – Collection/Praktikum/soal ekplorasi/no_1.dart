List<String> removeDuplicates(List<String> dataList) {
  // Buat sebuah set untuk menyimpan nilai unik
  Set<String> uniqueValues = {};

  // Iterasi melalui setiap elemen dalam list data
  for (var data in dataList) {
    // Tambahkan elemen ke dalam set
    uniqueValues.add(data);
  }

  // Konversi kembali set menjadi list
  List<String> uniqueList = uniqueValues.toList();

  return uniqueList;
}

void main() {
  List<String> sampleInput1 = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List<String> sampleInput2 = [
    'JS Racing',
    'amuse',
    'spoon',
    'spoon',
    'JS Racing',
    'amuse'
  ];

  // Hapus nilai duplikat dan cetak output
  print(removeDuplicates(
      sampleInput1)); // Output: [amuse, tommy kaira, spoon, HKS, litchfield]
  print(removeDuplicates(sampleInput2)); // Output: [JS Racing, amuse, spoon]
}

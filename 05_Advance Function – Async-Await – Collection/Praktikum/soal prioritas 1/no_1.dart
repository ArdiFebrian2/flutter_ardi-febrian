// Fungsi untuk mengalikan setiap elemen dalam list data dengan pengali dan mengembalikan list baru yang berisi hasilnya.
Future<List<int>> multiplyList(List<int> dataList, int multiplier) async {
  // Buat list untuk menyimpan hasil perkalian
  List<int> resultList = [];

  // Lakukan perulangan asynchronous melalui list data
  await Future.forEach(dataList, (int data) async {
    // Kalikan setiap elemen dengan pengali
    int result = data * multiplier;
    // Tambahkan hasil ke dalam list hasil
    resultList.add(result);
  });

  // Kembalikan list hasil setelah semua operasi selesai
  return resultList;
}

void main() async {
  // Contoh data dan pengali
  List<int> data = [1, 2, 3, 4, 5];
  int multiplier = 2;

  // Panggil fungsi dan tunggu hasilnya
  List<int> result = await multiplyList(data, multiplier);

  // Cetak hasil
  print(result);
}

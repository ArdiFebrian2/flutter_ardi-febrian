void countDataTypes(List<dynamic> data) {
  // Inisialisasi empat variabel untuk menghitung jumlah kemunculan masing-masing tipe data.
  int stringCount = 0;
  int boolCount = 0;
  int intCount = 0;
  int doubleCount = 0;

  // Gunakan perulangan untuk mengiterasi setiap elemen dalam list data.
  for (var element in data) {
    // Gunakan if atau is untuk memeriksa tipe data dari elemen dan increment counter yang sesuai.
    if (element is String) {
      stringCount++;
    } else if (element is bool) {
      boolCount++;
    } else if (element is int) {
      intCount++;
    } else if (element is double) {
      doubleCount++;
    }
  }

  // Setelah iterasi selesai, cetak jumlah kemunculan untuk setiap tipe data.
  print('Jumlah String: $stringCount');
  print('Jumlah Boolean: $boolCount');
  print('Jumlah Integer: $intCount');
  print('Jumlah Double: $doubleCount');
}

void main() {
  // Contoh penggunaan fungsi countDataTypes
  List<dynamic> data = ['hello', true, 5, 3.14, 'world', false, 10, 20.5, true];
  countDataTypes(data);
}

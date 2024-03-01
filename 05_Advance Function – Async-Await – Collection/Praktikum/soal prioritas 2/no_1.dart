void main() {
  // Membuat list dengan elemen-elemen berupa list yang berisi dua data
  List<List<dynamic>> dataList = [
    ['Ardi', 20],
    ['Kevin', 30],
    ['Fikri', 28],
    ['Habil', 25]
  ];

  // Membuat map dari list tersebut
  Map<String, int> dataMap = {};

  // Iterasi melalui setiap elemen dalam list dataList
  for (var element in dataList) {
    // Memasukkan data ke dalam map
    dataMap[element[0]] = element[1];
  }

  // Mencetak map
  print(dataMap);
}

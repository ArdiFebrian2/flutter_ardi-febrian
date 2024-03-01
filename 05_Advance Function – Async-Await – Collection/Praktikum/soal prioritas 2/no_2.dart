void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  // Hitung total nilai
  int total = 0;
  for (int nilaiIndividu in nilai) {
    total += nilaiIndividu;
  }

  // Hitung rata-rata
  double rataRata = total / nilai.length;

  // Lakukan pembulatan ke atas
  int rataRataBulat = rataRata.ceil();

  print('Rata-rata: $rataRataBulat');
}

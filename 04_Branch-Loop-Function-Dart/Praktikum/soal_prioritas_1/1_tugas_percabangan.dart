String getGrade(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "kosong"; // untuk nilai yang tidak memenuhi kondisi
  }
}

void main() {
  int nilai = 75; // Anda dapat mengubah nilai di sini
  print(getGrade(nilai));
}

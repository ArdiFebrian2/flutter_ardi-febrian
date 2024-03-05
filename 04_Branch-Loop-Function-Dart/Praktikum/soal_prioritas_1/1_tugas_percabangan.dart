// Fungsi getGrade menerima parameter nilai dan mengembalikan string berdasarkan kriteria nilai.
String getGrade(int nilai) {
  // Jika nilai lebih besar dari 70, maka kembali "Nilai A".
  // menggunakan struktrur kontrol if else
  if (nilai > 70) {
    return "Nilai A";
  }
  // Jika nilai lebih besar dari 40 (dan kurang dari atau sama dengan 70), kembali "Nilai B".
  else if (nilai > 40) {
    return "Nilai B";
  }
  // Jika nilai lebih besar dari 0 (dan kurang dari atau sama dengan 40), kembali "Nilai C".
  else if (nilai > 0) {
    return "Nilai C";
  }
  // Jika nilai tidak memenuhi kondisi di atas, kembali "kosong".
  else {
    return "kosong"; // untuk nilai yang tidak memenuhi kondisi
  }
}

void main() {
  int nilai = 75; // Anda dapat mengubah nilai di sini
  // Memanggil fungsi getGrade dengan nilai yang telah ditentukan dan mencetak hasilnya.
  print(getGrade(nilai));
}

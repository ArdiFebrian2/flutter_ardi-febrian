// Deklarasi kelas Hewan
class Hewan {
  double berat; // Properti untuk menyimpan berat hewan

  // Konstruktor untuk menginisialisasi berat hewan saat pembuatan objek
  Hewan(this.berat);
}

// Deklarasi kelas Mobil
class Mobil {
  double kapasitas; // Properti untuk menyimpan kapasitas muatan mobil
  List<Hewan> muatan =
      []; // Properti untuk menyimpan muatan mobil dalam bentuk list hewan

  // Konstruktor untuk menginisialisasi kapasitas muatan mobil saat pembuatan objek
  Mobil(this.kapasitas);

  // Method untuk menambahkan hewan ke dalam muatan mobil
  void tambahMuatan(Hewan hewan) {
    // Memeriksa apakah total muatan saat ini ditambah dengan berat hewan tidak melebihi kapasitas muatan mobil
    if (hitungTotalMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan); // Menambahkan hewan ke dalam list muatan
      print(
          'Hewan dengan berat ${hewan.berat} kg ditambahkan ke dalam muatan.');
    } else {
      print(
          'Kapasitas muatan tidak mencukupi untuk menambahkan hewan dengan berat ${hewan.berat} kg.');
    }
  }

  // Method untuk menghitung total berat muatan mobil
  double hitungTotalMuatan() {
    double totalMuatan = 0;
    muatan.forEach((hewan) {
      totalMuatan += hewan.berat;
    });
    return totalMuatan;
  }
}

// Fungsi main sebagai titik masuk utama program Dart
void main() {
  var mobil = Mobil(500); // Mobil dengan kapasitas muatan 500 kg

  var sapi = Hewan(300); // Hewan sapi dengan berat 300 kg
  var kambing = Hewan(200); // Hewan kambing dengan berat 200 kg

  mobil.tambahMuatan(sapi); // Menambahkan sapi ke dalam muatan
  mobil.tambahMuatan(kambing); // Menambahkan kambing ke dalam muatan

  print(
      'Total muatan: ${mobil.hitungTotalMuatan()} kg'); // Mencetak total muatan
}

// Kelas abstrak untuk bangun datar 2 dimensi
abstract class BangunDatar {
  double getArea(); // Metode untuk menghitung luas
  double getPerimeter(); // Metode untuk menghitung keliling
  double
      volume(); // Method untuk menghitung volume, diperlukan oleh kelas turunan
}

// Interface untuk persegi
abstract class Persegi {
  double hitungLuasPersegi(); // Metode untuk menghitung luas persegi
  double hitungKelilingPersegi(); // Metode untuk menghitung keliling persegi
}

// Interface untuk segitiga
abstract class Segitiga {
  double hitungLuasSegitiga(); // Metode untuk menghitung luas segitiga
  double hitungKelilingSegitiga(); // Metode untuk menghitung keliling segitiga
}

// Interface untuk lingkaran
abstract class Lingkaran {
  double hitungLuasLingkaran(); // Metode untuk menghitung luas lingkaran
  double
      hitungKelilingLingkaran(); // Metode untuk menghitung keliling lingkaran
}

// Implementasi Contoh

class PersegiImpl extends BangunDatar implements Persegi {
  final double sisi; // Panjang sisi persegi

  PersegiImpl({required this.sisi}); // Konstruktor

  @override
  double getArea() => hitungLuasPersegi(); // Mendapatkan luas persegi

  @override
  double getPerimeter() =>
      hitungKelilingPersegi(); // Mendapatkan keliling persegi

  @override
  double volume() => sisi * sisi; // Menghitung volume persegi

  @override
  double hitungLuasPersegi() => sisi * sisi; // Menghitung luas persegi

  @override
  double hitungKelilingPersegi() => 4 * sisi; // Menghitung keliling persegi
}

class SegitigaImpl extends BangunDatar implements Segitiga {
  final double alas; // Panjang alas segitiga
  final double tinggi; // Tinggi segitiga
  final double sisi1; // Panjang sisi 1 segitiga
  final double sisi2; // Panjang sisi 2 segitiga
  final double sisi3; // Panjang sisi 3 segitiga

  SegitigaImpl({
    required this.alas,
    required this.tinggi,
    required this.sisi1,
    required this.sisi2,
    required this.sisi3,
  }); // Konstruktor

  @override
  double getArea() => hitungLuasSegitiga(); // Mendapatkan luas segitiga

  @override
  double getPerimeter() =>
      hitungKelilingSegitiga(); // Mendapatkan keliling segitiga

  @override
  double volume() => 0.5 * alas * tinggi; // Menghitung volume segitiga

  @override
  double hitungLuasSegitiga() =>
      0.5 * alas * tinggi; // Menghitung luas segitiga

  @override
  double hitungKelilingSegitiga() =>
      sisi1 + sisi2 + sisi3; // Menghitung keliling segitiga
}

class LingkaranImpl extends BangunDatar implements Lingkaran {
  final double jariJari; // Jari-jari lingkaran

  LingkaranImpl({required this.jariJari}); // Konstruktor

  @override
  double getArea() => hitungLuasLingkaran(); // Mendapatkan luas lingkaran

  @override
  double getPerimeter() =>
      hitungKelilingLingkaran(); // Mendapatkan keliling lingkaran

  @override
  double volume() => 3.14 * jariJari * jariJari; // Menghitung volume lingkaran

  @override
  double hitungLuasLingkaran() =>
      3.14 * jariJari * jariJari; // Menghitung luas lingkaran

  @override
  double hitungKelilingLingkaran() =>
      2 * 3.14 * jariJari; // Menghitung keliling lingkaran
}

void main() {
  final persegi = PersegiImpl(sisi: 5); // Membuat objek persegi
  final segitiga = SegitigaImpl(
    alas: 5,
    tinggi: 8,
    sisi1: 7,
    sisi2: 7,
    sisi3: 7,
  ); // Membuat objek segitiga
  final lingkaran = LingkaranImpl(jariJari: 5); // Membuat objek lingkaran

  // Menampilkan luas, keliling, dan volume
  print('persegi');
  print('Luas persegi: ${persegi.getArea()}');
  print('Keliling persegi: ${persegi.getPerimeter()}');
  print('Volume persegi: ${persegi.volume()}');

  print('segitiga');
  print('Luas segitiga: ${segitiga.getArea()}');
  print('Keliling segitiga: ${segitiga.getPerimeter()}');
  print('Volume segitiga: ${segitiga.volume()}');

  print('lingkaran');
  print('Luas lingkaran: ${lingkaran.getArea()}');
  print('Keliling lingkaran: ${lingkaran.getPerimeter()}');
  print('Volume lingkaran: ${lingkaran.volume()}');
}

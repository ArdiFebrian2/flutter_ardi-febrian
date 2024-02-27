class Persegi {
  double sisi;

  // Konstruktor untuk menginisialisasi sisi persegi
  Persegi(this.sisi);

  // Metode untuk menghitung luas persegi
  double hitungLuas() {
    return sisi * sisi;
  }

  // Metode untuk menghitung keliling persegi
  double hitungKeliling() {
    return 4 * sisi;
  }
}

class PersegiPanjang {
  double panjang;
  double lebar;

  // Konstruktor untuk menginisialisasi panjang dan lebar persegi panjang
  PersegiPanjang(this.panjang, this.lebar);

  // Metode untuk menghitung luas persegi panjang
  double hitungLuas() {
    return panjang * lebar;
  }

  // Metode untuk menghitung keliling persegi panjang
  double hitungKeliling() {
    return 2 * (panjang + lebar);
  }
}

void main() {
  // Membuat objek untuk persegi dengan sisi 5
  Persegi persegi = Persegi(5.0);

  // Menampilkan luas dan keliling persegi
  print('Luas Persegi: ${persegi.hitungLuas()}');
  print('Keliling Persegi: ${persegi.hitungKeliling()}');

  // Membuat objek untuk persegi panjang dengan panjang 4 dan lebar 6
  PersegiPanjang persegiPanjang = PersegiPanjang(4.0, 6.0);

  // Menampilkan luas dan keliling persegi panjang
  print('Luas Persegi Panjang: ${persegiPanjang.hitungLuas()}');
  print('Keliling Persegi Panjang: ${persegiPanjang.hitungKeliling()}');
}

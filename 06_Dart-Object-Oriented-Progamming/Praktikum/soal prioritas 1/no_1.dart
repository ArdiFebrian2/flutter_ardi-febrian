class Hewan {
  double _berat; // Deklarasi variabel berat sebagai variabel pribadi (_berat)

  Hewan(
      this._berat); // Konstruktor Hewan yang mengambil nilai berat dan menginisialisasi _berat

  double get berat => _berat; // Getter untuk mengambil nilai _berat

  set berat(double nilaiBerat) {
    // Setter untuk mengatur nilai _berat
    _berat =
        nilaiBerat; // Mengatur nilai _berat dengan nilai baru yang diberikan
  }
}

void main() {
  var kucing =
      Hewan(5.0); // Membuat instance kucing dari kelas Hewan dengan berat 5.0
  print('Berat badan kucing: ${kucing.berat}'); // Mencetak berat badan kucing

  var harimau = Hewan(
      10.0); // Membuat instance harimau dari kelas Hewan dengan berat 10.0
  print(
      'Berat badan harimau: ${harimau.berat}'); // Mencetak berat badan harimau
}

// Deklarasi kelas Buku
class Buku {
  // Properti-properti buku
  final String id;
  final String judul;
  final String penerbit;
  final double harga;
  final String kategori;

  // Konstruktor Buku
  Buku({
    required this.id,
    required this.judul,
    required this.penerbit,
    required this.harga,
    required this.kategori,
  });

  // Override method toString() untuk mencetak informasi buku
  @override
  String toString() {
    return '''
    ID: $id
    Judul: $judul
    Penerbit: $penerbit
    Harga: $harga
    Kategori: $kategori
    ''';
  }
}

// Deklarasi kelas TokoBuku
class TokoBuku {
  // List untuk menyimpan buku-buku
  final List<Buku> _buku = [];

  // Method untuk menambahkan buku ke dalam list
  void addBuku(Buku buku) {
    _buku.add(buku);
  }

  // Method untuk mendapatkan semua buku dari list
  List<Buku> getAllBuku() {
    return _buku;
  }

  // Method untuk menghapus buku dari list berdasarkan ID
  void deleteBuku(String id) {
    _buku.removeWhere((buku) => buku.id == id);
  }
}

void main() {
  // Membuat objek tokoBuku dari kelas TokoBuku
  final tokoBuku = TokoBuku();

  // Menambahkan beberapa buku ke tokoBuku
  tokoBuku.addBuku(Buku(
    id: '1',
    judul: 'Buku Dart untuk Pemula',
    penerbit: 'Informatika',
    harga: 100000,
    kategori: 'Pemrograman',
  ));
  tokoBuku.addBuku(Buku(
    id: '2',
    judul: 'Belajar Flutter dengan Mudah',
    penerbit: 'Alterra Academy',
    harga: 150000,
    kategori: 'Pemrograman Mobile',
  ));

  // Mendapatkan semua buku dan mencetak informasinya
  final semuaBuku = tokoBuku.getAllBuku();
  for (Buku buku in semuaBuku) {
    print(buku);
  }

  // Menghapus buku dengan ID '1'
  tokoBuku.deleteBuku('1');

  // Mendapatkan semua buku setelah dihapus dan mencetak informasinya
  final semuaBukuSetelahDihapus = tokoBuku.getAllBuku();
  for (Buku buku in semuaBukuSetelahDihapus) {
    print(buku);
  }
}

# UI Testing

1. UI Testing adalah pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna.

- UI Testing di Flutter 
Disebut juga widget testing sehingga pengujian dilakukkan pada widgets tertentu pada aplikasi Flutter yang telah dibuat dengan menuliskan script yang dapat dijalankan secara otomatis.

### Keuntungan Ui Testing 
- Memastikan seluruh widget memberi tampilan yg sesuai
- Memastikan seluruh interaksi dapat diterima diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

2. Melakukan UI Testing
- Instalasi Package Testing sudah terinstal saat project di buat.

### View
- menggunakan StatefullWidget
cara menampilkan data di view yaitu;
- letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets
```dart
void main() {
  testWidgets('Contact View Test', (WidgetTester tester) async {
    await tester.pumpWidget( MaterialApp(home: GalleryView()));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('appbar')), findsOneWidget);
    expect(find.byKey(const Key('appbarTitle')),  findsOneWidget);
    expect(find.byKey(const Key('GridView')), findsOneWidget);
  });
}
```

### Script Testing
- Test case diawali dengan testWidgets dan di beri judul
- simulasi proses mengaktifkan halaman AboutScreen
- Memeriksa apakah halaman tersebut terdapat teks "About Screen"

### Menjalankan Testing 
- Perintah flutter test untuk menjalankan seluruh file test yg dibuat
- Hasil dari flutter test jikan pengujian berhasil dengan hasil all test passed
- dan jika menjalankan testing gagal akan ditampilkan penyebab gagalnya pengujian dengan some tests failed 

### Penulisan Script Testing 
- Dilakukan pada foder test 
- Nama file harus diikuti _test.dart contoh: contact_test.dart
- Tiap file berisi fungsi main() yang di dalamnya dapat di tuliskan script testing
- Tiap skenario pengujian disebut test case
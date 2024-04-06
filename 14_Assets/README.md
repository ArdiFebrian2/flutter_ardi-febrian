ASSETS
	Assets
Dalam Flutter, aset merujuk pada semua file yang diperlukan oleh aplikasi, seperti gambar, ikon, file konfigurasi, dan banyak lagi. Mereka diimpor ke dalam proyek dan dapat diakses secara programatik untuk digunakan dalam UI atau logika aplikasi.-File yang di bundled dan di deployed bersamaan dengan aplikasi.

Menentukan Assets:
-Flutter menggunakan Pubspec.yml
-Pubspec.yml terletak pada root project,untuk mengidentifikasi assets yang dibutuhkan aplikasi
-Gunakan karakter “/” untuk memasukan semua assets dibawah satu directory name

	Image
Gambar adalah aset visual yang penting dalam pengembangan aplikasi Flutter. Mereka termasuk grafis, foto, ikon, dan lainnya, yang diperlukan untuk memperindah antarmuka pengguna (UI) dan meningkatkan pengalaman pengguna.

Loading Images:
-Gunakan Widget Image
-Membutuhkan properti image dengan nilai class AssetsImage()
-Menggunakan method Image.assets,mendapatkan image yang sudah ditambah dalam project           
-Menggunakan method Image.network,mendapatkan data image melalui internet dengan url

	Vector
Vector merupakan format grafis yang menggambarkan gambar dalam bentuk garis, kurva, dan bentuk geometris lainnya. Dalam Flutter, vektor digunakan untuk membuat grafik dan ilustrasi yang skalabel dan dapat disesuaikan ukurannya tanpa kehilangan kualitas. Mereka sering digunakan untuk ikon aplikasi, grafik UI, dan elemen desain lainnya.

Loading SVG:
-Menambahkan kelas SvgPicture
-Kemudian bisa menambahkan beberapa method,salah satunya ialah network
```dart
SvgPicture.network(
‘https://www.svgrepo.com/show/32645/hotel.svg’
placeholderBuilder:(BuildContext context) ==> const CircularProgressIndicator(),
width: 300,
)
```

	Font
Font digunakan untuk mengatur tampilan teks dalam aplikasi Flutter. Flutter mendukung berbagai jenis font dan memungkinkan penggunaan font kustom. Font dapat diatur untuk mengubah gaya, ukuran, dan warna teks sesuai kebutuhan aplikasi.

Costum Font:
-Cari dan download font (Ex.https://font.google.com/)
-Import  file .ttf
-Daftarkan font di Pubspec.yml
-Mengatur font sebagai default
-Gunakan Font spesifik widget 

Font dari Package:
-Tambahkan package google_fonts di dependencies
-Import Package di file dart
-Gunakan font dengan memanggil GoogleFonts.nameFont()








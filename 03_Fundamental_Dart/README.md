DART FUNDAMENTALS
1.Variabel:
    -Dart mendukung berbagai jenis variabel, termasuk integer, double, string, boolean, dan tipe data lainnya.
    -Variabel dalam Dart dapat dideklarasikan dengan kata kunci var untuk inferensi tipe, atau secara eksplisit dengan menentukan tipe datanya.

2.Null Safety:
    -Null safety adalah fitur baru dalam Dart yang mencegah nilai null dari menyebabkan kesalahan saat runtime.
    -dart 2.12 dan versi setelahnya menerapkan null safety secara default, memastikan bahwa variabel tidak boleh memiliki nilai null kecuali dinyatakan secara    eksplisit.
    -Ini membantu mengurangi kesalahan yang disebabkan oleh nilai null dan meningkatkan keamanan dan kestabilan kode.

3.Null Safety dan Function:
    -Dalam Dart dengan null safety, parameter fungsi dan nilai kembalinya dapat dideklarasikan dengan atau tanpa kemampuan menerima atau mengembalikan nilai null.
    -Untuk parameter yang diharapkan tidak null, tanda tanya (?) digunakan setelah tipe data parameter.
4.late Keyword:
    -late adalah kata kunci yang digunakan untuk menunda inisialisasi variabel hingga saat mereka pertama kali diakses.
    -Berguna ketika Anda ingin menunda inisialisasi hingga diperlukan, misalnya, ketika variabel tersebut diinisialisasi di dalam konstruktor atau metode.
    -Memungkinkan penggunaan variabel tanpa memerlukan nilai awal saat dideklarasikan.
    -Berguna untuk menghindari kesalahan "null" saat variabel digunakan sebelum diinisialisasi.
5. Collections:
    -Dart menyediakan berbagai jenis koleksi seperti List, Set, dan Map untuk mengelola kumpulan data.
    -List adalah kumpulan nilai yang diurutkan dan dapat diakses menggunakan indeks.
    -Set adalah kumpulan nilai yang unik tanpa urutan tertentu.
    -Map adalah kumpulan pasangan kunci-nilai yang memetakan kunci ke nilai.
6. Nullable:
    -Dart memiliki konsep nilai nullable yang memungkinkan variabel untuk memiliki nilai null.
    -Ini memungkinkan penggunaan nilai yang tidak ada atau tidak ditentukan.
    -Dapat digunakan dengan menambahkan tanda tanya (?) setelah tipe data variabel.
7. var, dynamic, final, dan const:
    -var adalah kata kunci yang digunakan untuk mendeklarasikan variabel tanpa menyebutkan tipe datanya secara eksplisit. Tipe datanya akan ditentukan secara --otomatis oleh Dart.
    -dynamic adalah tipe data khusus yang dapat menyimpan nilai dari jenis apa pun. Tidak ada pengecekan tipe statis yang dilakukan oleh kompiler.
    -final digunakan untuk mendeklarasikan variabel yang nilainya tetap dan tidak bisa diubah setelah diinisialisasi.
    -const digunakan untuk mendeklarasikan variabel yang nilainya tetap dan diketahui pada saat kompilasi.

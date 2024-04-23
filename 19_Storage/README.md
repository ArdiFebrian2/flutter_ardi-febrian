# STORAGE

1.Penyimpanan Lokal:
Penyimpanan lokal mengacu pada penyimpanan data di perangkat yang bersifat persistent dan dapat diakses tanpa koneksi internet. Ini termasuk penyimpanan file di sistem file perangkat dan database lokal seperti SQLite. Penyimpanan lokal biasanya lebih cepat dalam akses dan dapat digunakan untuk menyimpan data yang perlu diakses oleh aplikasi tanpa ketergantungan pada sumber eksternal.

2.Shared Preferences:
Shared Preferences adalah metode penyimpanan sederhana yang menggunakan key-value pairs untuk menyimpan data. Data yang disimpan di Shared Preferences bersifat persistent dan dapat diakses kapan saja oleh aplikasi. Ini ideal untuk menyimpan preferensi pengguna, pengaturan aplikasi, atau data sederhana lainnya yang tidak memerlukan struktur database yang kompleks.

3.Local Database (SQLite):
SQLite adalah database relasional yang ringan dan tersedia di banyak platform, termasuk mobile. Dalam konteks Flutter atau pengembangan aplikasi mobile lainnya, SQLite sering digunakan sebagai database lokal untuk menyimpan data yang lebih kompleks dan terstruktur. Ini memungkinkan aplikasi untuk melakukan operasi CRUD (Create, Read, Update, Delete) pada data secara efisien di perangkat.

4.Aplikasi Task Management (Lanjutan):
Dalam konteks aplikasi task management, penyimpanan data memegang peranan penting untuk melacak dan mengelola tugas-tugas yang diatur oleh pengguna.
    -Penyimpanan Lokal: Data seperti daftar tugas, deadline, dan status tugas dapat disimpan secara lokal untuk diakses tanpa koneksi internet.
    -Shared Preferences: Preferensi pengguna seperti tema, pengaturan tampilan, atau filter tugas dapat disimpan menggunakan Shared Preferences.
    -Local Database (SQLite): Untuk manajemen tugas yang lebih kompleks dan struktural, SQLite dapat digunakan. Ini memungkinkan pengguna untuk menyimpan detail tugas, catatan, prioritas, dan lainnya dalam format yang terstruktur.
    Fungsionalitas: Aplikasi task management biasanya memerlukan fungsionalitas seperti penambahan tugas baru, pengeditan, penghapusan, dan pengaturan reminder atau notifikasi. Selain itu, integrasi dengan kalender atau fitur kolaborasi antar pengguna juga bisa menjadi fitur tambahan yang berguna.
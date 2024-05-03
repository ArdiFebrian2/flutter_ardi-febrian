# Introduction REST API – JSON serialization/deserialization

1.REST API (Representational State Transfer):
REST adalah gaya arsitektur perangkat lunak yang digunakan dalam pengembangan web untuk membuat layanan web ringan, skalabel, dan mudah diatur.
REST API beroperasi berdasarkan prinsip bahwa setiap entitas dalam sistem memiliki URL unik, dan operasi tertentu (GET, POST, PUT/PATCH, DELETE) dapat digunakan untuk berinteraksi dengan entitas tersebut.

2.HTTP (Hypertext Transfer Protocol):
HTTP adalah protokol komunikasi yang digunakan di web untuk mentransfer data antara klien dan server.
Metode HTTP yang paling umum digunakan adalah GET, POST, PUT, PATCH, dan DELETE, masing-masing memiliki tujuan dan perilaku yang berbeda dalam interaksi antara klien dan server.

3.Dio
Dio adalah pustaka HTTP untuk Dart yang memungkinkan pengembang untuk membuat permintaan HTTP dengan mudah dari aplikasi Flutter atau Dart.
Dio menyediakan antarmuka yang sederhana dan mudah digunakan untuk membuat, mengirim, dan menanggapi permintaan HTTP.

4.Serialisasi JSON:
JSON (JavaScript Object Notation) adalah format data yang ringan dan mudah dibaca dan ditulis, sering digunakan dalam pertukaran data di web.
Serialisasi JSON adalah proses mengubah objek atau struktur data menjadi representasi JSON agar dapat ditransmisikan melalui jaringan atau disimpan di penyimpanan.

5.Konsumsi REST API (GET, POST, PUT/PATCH, DELETE):
GET: Digunakan untuk meminta data dari server berdasarkan URL yang ditentukan.
POST: Digunakan untuk mengirim data baru ke server untuk dibuat.
PUT/PATCH: Digunakan untuk memperbarui data yang ada di server. PUT biasanya digunakan untuk penggantian penuh, sementara PATCH digunakan untuk pembaruan sebagian dari data.
DELETE: Digunakan untuk menghapus data dari server berdasarkan URL yang ditentukan.
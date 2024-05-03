import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  // URL endpoint untuk permintaan PUT
  final putUrl = "https://jsonplaceholder.typicode.com/posts/1";

  // Data untuk permintaan PUT.
  final putData = {
    "id": 1,
    "title": "foo",
    "body": "bar",
    "userId": 1,
  };

  try {
    final response = await dio.put(putUrl, data: putData);

    if (response.statusCode == 200) {
      print("Data berhasil diperbarui!");
      print("Response dari server:");
      print(response.data);
    } else {
      print("Gagal memperbarui data. Kode status: ${response.statusCode}");
    }
  } catch (error) {
    print("Terjadi kesalahan: $error");
  }
}

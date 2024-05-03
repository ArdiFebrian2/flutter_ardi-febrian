import 'package:dio/dio.dart';

import 'data_model.dart';

void main() async {
  final dio = Dio();

  final jsonUrl =
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2";

  try {
    final response = await dio.get(jsonUrl);

    if (response.statusCode == 200) {
      // Mengonversi data JSON menjadi objek Dart.
      final contact = Contact.fromJson(response.data);

      print("Data JSON yang diubah ke dalam objek Dart:");
      print("ID: ${contact.id}");
      print("Name: ${contact.name}");
      print("Phone: ${contact.phone}");
    } else {
      print("Gagal mengambil data JSON. Kode status: ${response.statusCode}");
    }
  } catch (error) {
    print("Terjadi kesalahan: $error");
  }
}

import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  // URL untuk POST request
  final postUrl =
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts";

  // Data contact dalam bentuk objek Dart.
  final contactData = {
    "name": "John Doe",
    "email": "johndoe@example.com",
    "phone": "1234567890",
  };

  try {
    final response = await dio.post(postUrl, data: contactData);

    if (response.statusCode == 201) {
      print("Data contact berhasil disimpan!");
      print("Response dari server:");
      print(response.data);
    } else {
      print(
          "Gagal menyimpan data contact. Kode status: ${response.statusCode}");
    }
  } catch (error) {
    print("Terjadi kesalahan: $error");
  }
}

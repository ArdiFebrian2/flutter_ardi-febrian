import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List nama produk
    List<String> productNames = [
      "Learn Flutter",
      "Learn Dart",
      "Learn C++",
      "Learn Python",
      "Learn Java",
      "Learn PHP",
      "Learn Golang",
      "Learn C#",
      "Learn Laravel",
      "Learn Ruby"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta-Widget Layout-Exploration'),
        centerTitle: true,
        backgroundColor: Color(0xFF00A8E8), // Change the app bar color here
      ),
      body: ListView.builder(
        itemCount: productNames.length, // Jumlah item di ListView
        itemBuilder: (BuildContext context, int index) {
          String itemName = productNames[index]; // Nama produk
          // Mengembalikan ListTile dengan ikon dari huruf awal nama
          return ListTile(
            leading: Icon(
              Icons.computer,
              color: Color(0xFF00A8E8), // Warna ikon computer biru
            ), // Ikon komputer
            title: Text(
              itemName,
              style: TextStyle(
                color: Color(0xFF00A8E8), // Warna teks biru
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Color(0xFF00A8E8), // Warna ikon panah biru
            ), // Tombol panah ke kanan
            onTap: () {
              // Aksi saat item diklik
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi saat tombol floating action button ditekan
        },
        child: Icon(Icons.add), // Ikon tambah
        backgroundColor: Color(0xFFA8E800), // Warna latar belakang tombol
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
          // Icon "more"
        ],
      ),
    );
  }
}

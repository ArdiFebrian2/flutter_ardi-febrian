import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List nama produk
    List<String> productNames = [
      "Joko",
      "Gibran",
      "putin",
      "Donald",
      "Andi",
      "Putra",
      "Jumono",
      "Samsul",
      "Kurniawan",
      "Udin"
    ];

    // List nomor produk
    List<String> productNumbers = [
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716",
      "0821312894716"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text("Home Page"),
            ),
            ListTile(
              title: Text("About Page"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Jumlah item di ListView
        itemBuilder: (BuildContext context, int index) {
          String itemName = productNames[index]; // Nama produk
          String itemNo = productNumbers[index]; // Kode produk
          // Mendapatkan huruf awal dari nama
          String initial = itemName.substring(0, 1);
          // Mengembalikan ListTile dengan ikon dari huruf awal nama
          return ListTile(
            leading: CircleAvatar(
              child: Text(initial),
            ),
            title: Text(itemName),
            subtitle: Text(itemNo),
            onTap: () {
              // Aksi saat item diklik
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

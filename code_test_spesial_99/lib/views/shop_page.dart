import 'package:flutter/material.dart';
import 'package:code_test_spesial_99/views/add_product.dart';

class ShopPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'nama': 'Produk 1',
      'harga': '\$10',
      'kategori': 'Elektronik',
      'penjual': 'Penjual A',
      'totalPenjual': '100',
    },
    {
      'nama': 'Produk 2',
      'harga': '\$20',
      'kategori': 'Pakaian',
      'penjual': 'Penjual B',
      'totalPenjual': '50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shop'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Daftar Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text(product['nama']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga: ${product['harga']}'),
                        Text('Kategori: ${product['kategori']}'),
                        Text('Penjual: ${product['penjual']}'),
                        Text('Total Penjual: ${product['totalPenjual']}'),
                      ],
                    ),
                    trailing: Text(product['harga']),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Produk'),
            ),
          ),
        ],
      ),
    );
  }
}

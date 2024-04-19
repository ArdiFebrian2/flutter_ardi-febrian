import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Olahraga'
  ];
  final List<String> promotions = ['Promosi 1', 'Promosi 2', 'Promosi 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
              ),
              items: promotions
                  .map((item) => Container(
                        child: Center(
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        color: Color(0xFF4793AF),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Kategori Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  leading: Icon(Icons.category),
                  onTap: () {
                    // Aksi ketika kategori dipilih
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

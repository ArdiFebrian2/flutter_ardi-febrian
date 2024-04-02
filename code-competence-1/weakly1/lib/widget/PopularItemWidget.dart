import 'package:flutter/material.dart';

class PopularItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            _buildPopularItem(
              "assets/images/milktea.png",
              "Milk Tea",
              "Minuman Fresh Cokelat",
              "Rp. 15.000",
            ),
            _buildPopularItem(
              "assets/images/1192.jpg",
              "Burger",
              "Burger Spicy",
              "Rp. 20.000",
            ),
            _buildPopularItem(
              "assets/images/dessert.png",
              "Dessert",
              "Dessert Legit",
              "Rp. 30.000",
            ),
            _buildPopularItem(
              "assets/images/donat.png",
              "Donat",
              "Donat Coklat",
              "Rp. 17.000",
            ),
            _buildPopularItem(
              "assets/images/eskrim.png",
              "Es Krim",
              "Es Krim Enak",
              "Rp. 25.000",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItem(
    String imagePath,
    String title,
    String subtitle,
    String price,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: 170,
        height: 225,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  imagePath,
                  height: 130,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

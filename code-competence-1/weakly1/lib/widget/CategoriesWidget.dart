import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            _buildCategoryItem("assets/images/drink.png"),
            _buildCategoryItem("assets/images/burger.png"),
            _buildCategoryItem("assets/images/cake.png"),
            _buildCategoryItem("assets/images/donut.png"),
            _buildCategoryItem("assets/images/icecream.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

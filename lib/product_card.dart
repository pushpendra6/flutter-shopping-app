import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageurl;
  final String company;
  final List<int> size;

  const ProductCard({
    required this.title,
    required this.company,
    required this.imageurl,
    required this.size,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(216, 240, 253, 1),
      child: Column(
        children: [
          Text(title),
          SizedBox(height: 5),
          Text('\$ $price'),
          // SizedBox(height: 5),
          Image(image: AssetImage(imageurl))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String imageurl;
  final String company;
  final List<int> size;
  final Color backgroundColor;

  const ProductCard({
    required this.title,
    required this.company,
    required this.imageurl,
    required this.size,
    required this.price,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text('₹ $price', style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 5),
          Image(image: AssetImage(imageurl)),
        ],
      ),
    );
  }
}

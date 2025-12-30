import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/dummy_products_data.dart';
import 'package:flutter_shopping_app/widgets/product_card.dart';
import 'package:flutter_shopping_app/screens/product_details_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filterList = const [
    'All',
    'Nike',
    'Addidas',
    'Bata',
    'Red Tape',
    'Asics',
  ];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filterList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 255, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
        //if want capsule like search add right radius also
        // right: Radius.circular(30),
      ),
    );
    final filteredProducts = selectedFilter == 'All'
        ? products
        : products
              .where((product) => product['company'] == selectedFilter)
              .toList();
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Shoe',
                        style: TextStyle(
                          color: Colors.black87, // Shoe color
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'World',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary, // World color
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //expanded take as much space is available  to avoid text field error which requires whole screen error
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              itemCount: filterList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filterList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: TextStyle(fontSize: 16),
                      backgroundColor: filter == selectedFilter
                          ? Color.fromRGBO(254, 206, 1, 1)
                          : Color.fromRGBO(245, 247, 249, 1),
                      side: BorderSide(
                        color: const Color.fromARGB(255, 217, 222, 227),
                      ),
                      padding: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:  filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsScreen(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    company: product['company'] as String,
                    imageurl: product['imageUrl'] as String,
                    size: product['sizes'] as List<int>,
                    price: product['price'] as int,
                    backgroundColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/dummy_products_data.dart';
import 'package:flutter_shopping_app/widgets/product_card.dart';
import 'package:flutter_shopping_app/pages/product_details_page.dart';


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
    return  SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoe\nCollection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
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
              height: 100,
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
                        padding: EdgeInsets.all(10),
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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                      }));
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      company: product['company']as String,
                      imageurl: product['imageUrl']as String,
                      size: product['sizes'] as List<int>,
                      price: product['price'] as double,
                      backgroundColor : index.isEven ? Color.fromRGBO(216, 240, 253, 1) : Color.fromRGBO(245, 247, 249, 1),
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
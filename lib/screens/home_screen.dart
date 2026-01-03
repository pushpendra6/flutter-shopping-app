import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/screens/cart_screen.dart';
import 'package:flutter_shopping_app/widgets/product_list.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> pages = [ProductList(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return PopScope (
      canPop: false,
      child: Scaffold(
        body: IndexedStack(index: currentPage, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  if (cartProvider.totalItems > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          cartProvider.totalItems.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

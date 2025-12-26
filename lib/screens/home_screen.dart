import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/screens/cart_screen.dart';
import 'package:flutter_shopping_app/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int currentPage =0 ;
  List<Widget> pages =  [ProductList(),CartScreen()]; 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
      currentIndex: currentPage,
      onTap: (value) {
        setState(() {
          currentPage =value;
        });
      },
      items:const  [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ''),
    ]),
    
    );
  }
}

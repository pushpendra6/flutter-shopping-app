import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    final index = cart.indexWhere(
      (item) => item['id'] == product['id'] && item['size'] == product['size'],
    );

    if (index >= 0) {
      cart[index]['quantity'] += 1;
    } else {
      cart.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.removeWhere(
      (item) => item['id'] == product['id'] && item['size'] == product['size'],
    );
    notifyListeners();
  }

  int get totalItems =>
      cart.fold(0, (sum, item) => sum + item['quantity'] as int);

  double get totalPrice =>
      cart.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
}

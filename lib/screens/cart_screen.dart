import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:flutter_shopping_app/screens/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/empty_cart.json',
                    width: 200,
                    height: 200,
                    repeat: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                    radius: 40,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Product'),
                            content: Text(
                              'Are you sure want to remove the product from cart ?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<CartProvider>().removeProduct(
                                    cartItem,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Size: ${cartItem['size']}'),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Quantity: ${cartItem['quantity']}'),
                      ),
                    ],
                  ),
                );
              },
            ),

      bottomNavigationBar: cart.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 💰 Total Amount Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Cart Value',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₹${context.watch<CartProvider>().totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // 🧾 Divider line
                  const Divider(thickness: 1),

                  const SizedBox(height: 12),

                  // ✅ Checkout Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CheckoutScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

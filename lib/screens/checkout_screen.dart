import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Checkout',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8), // 0 = perfect square
              child: Image.asset(
                cartItem['imageUrl'],
                width: 180,
                height: 200,
                // fit: BoxFit.cover,
              ),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Price: ${cartItem['price']}'),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: SafeArea(
        top: true,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔥 VERY IMPORTANT
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

              const SizedBox(height: 10),
              const Divider(thickness: 1),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  // payment logic
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

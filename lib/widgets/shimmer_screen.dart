import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/auth_provider.dart';
import 'package:flutter_shopping_app/screens/home_screen.dart';
import 'package:flutter_shopping_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // Make sure this path points to your actual home file

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Wait for 3 seconds to show off the shimmer effect
    await Future.delayed(const Duration(seconds: 3));

    // Safety check to ensure the widget is still in the tree
    if (!mounted) return;

    final isAuthenticate = context.read<AuthProvider>().isAuthenticated;
    print('isAutheicate 1 :- $isAuthenticate');

    // Navigate to Home Screen and remove Splash from the back-stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isAuthenticate ? const HomeScreen() : LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The Shimmer Effect
            Shimmer.fromColors(
              baseColor: Colors.yellow.shade300,
              highlightColor: Colors.white,
              child: Icon(Icons.shopping_bag, size: 160, color: Colors.white),
            ),

            Shimmer.fromColors(
              baseColor: Colors.black54,
              highlightColor: Colors.grey[100]!,
              child: const Text(
                "Premium Shoes",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

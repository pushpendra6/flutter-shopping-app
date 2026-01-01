import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/screens/home_screen.dart';
import 'package:shimmer/shimmer.dart'; // Make sure this path points to your actual home file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

    // Navigate to Home Screen and remove Splash from the back-stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
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

            // Shimmer.fromColors(
            //   baseColor: const Color(0xFFFFEB3B), // Your logo yellow
            //   highlightColor: Colors.white,
            //   period: const Duration(milliseconds: 1500),
            //   child: ColorFiltered(
            //     colorFilter: const ColorFilter.mode(
            //       Colors.white,
            //       BlendMode.srcIn,
            //     ),
            //     child: Image.asset(
            //       'assets/icon/app_icon.png',
            //       width: 180,
            //       height: 180,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            // Optional: Add a subtle loading text or your app name
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

import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/auth_provider.dart';
import 'package:flutter_shopping_app/screens/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String? phoneError;
  String? otpError;
  AuthProvider get authProvider => context.read<AuthProvider>();



  void sendOtpBtn() {
    final phone = mobileController.text.trim();

    if (phone.isEmpty || phone.length != 10) {
      setState(() {
        phoneError = 'Enter a valid 10-digit mobile number';
      });
      return;
    }

    setState(() {
      phoneError = null; // clear error
    });

    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Verify OTP'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                'Enter the 6-digit OTP send to the +91-${mobileController.text}',
              ),
              Divider(thickness: 1,color: Colors.black,height: 10,),
              Text('For Testing the otp is 222333'),
              TextField(
                maxLength: 6,
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  counterText: '',
                ),
              ),
              otpError != null
                  ? Text('Invalid OTP', style: TextStyle(color: Colors.red))
                  : const SizedBox(height: 10),
            ],
          ),

          actions: [
            TextButton(
              onPressed: _verifyOtp,
              child: const Text(
                'Verify',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _verifyOtp() {
    final userOtp = otpController.text.trim();
    if (userOtp.isEmpty || userOtp.length < 6 || userOtp != '222333') {
      setState(() {
        otpError = 'Enter a valid OTP';
      });
      return;
    } else {
      FocusScope.of(context).unfocus();
      setState(() {
        otpError = null;
      });

      final phone = mobileController.text.trim();
      context.read<AuthProvider>().login(phone);
      print('isAutheicate 2:- ${authProvider.isAuthenticated}');

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeScreen()),
        (route) => false, 
      );
    }
  }

  @override
  void dispose() {
    mobileController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/login.json',
                width: 200,
                height: 200,
                repeat: true,
              ),
              const SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Shoe',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'World',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: 'Enter Your Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                  counterText: '',
                ),
              ),
              if (phoneError != null) ...[
                const SizedBox(height: 6),
                Text(
                  phoneError!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: sendOtpBtn,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                  elevation: WidgetStatePropertyAll(10),
                ),

                child: Text(
                  'Send OTP',
                  style: TextStyle(
                    color: Colors.black,
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

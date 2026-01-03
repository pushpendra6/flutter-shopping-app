import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String mobileNumber) {
    _isAuthenticated = true;
    notifyListeners();
  }

  // void logout(String mobileNumber) {
  //   _isAuthenticated = false;
  //   notifyListeners();
  // }
}

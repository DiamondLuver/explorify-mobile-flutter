import 'package:flutter/material.dart';

class UserInputLogic extends ChangeNotifier {
  String email = "";
  String password = "";
  String username = ""; // Assuming you want username as well

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners(); // Notify listeners (RegisterPage) about changes
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }
}

// otp_provider.dart

import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  String _code = '';

  String get code => _code;

  set code(String newCode) {
    _code = newCode;
    notifyListeners(); // Notify listeners of a change
  }
}

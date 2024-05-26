import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String OTP;
  final String token;
  User(
      {required this.name,
      required this.password,
      required this.email,
      required this.OTP,
      required this.phoneNumber,
      required this.token});
  User.fromJson(
    Map<dynamic, dynamic> json,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.OTP,
    this.token,
  );
  
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> registration({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      var response = await http.post(Uri.parse('$url/currentUser/'),
          body: {"username": username, "password": password});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

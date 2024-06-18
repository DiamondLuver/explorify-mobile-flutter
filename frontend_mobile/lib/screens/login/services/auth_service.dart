import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registration(
      {required BuildContext context,
      required String username,
      required String password,
      required String email}) async {
    try {
      // trim input and convert to lowercase
      email = email.trim().toLowerCase();
      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.register),
        body: jsonEncode(
          {"username": username, "password": password, "email": email},
        ),
      );
      print(response);

      if (!context.mounted) return;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Signed Up!');
          // Navigator.popUntil(
          //     context, ModalRoute.withName(LoginScreen.routeName));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

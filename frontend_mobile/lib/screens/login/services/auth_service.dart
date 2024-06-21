import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/api_constants.dart';
import 'package:frontend_mobile/model/cv/user_model.dart';
import 'package:frontend_mobile/model/user/OTP_model.dart';
import 'package:frontend_mobile/model/user/token_model.dart';
import 'package:frontend_mobile/provider/user_provider.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/login/logic/otp_logic.dart';
import 'package:frontend_mobile/screens/login/verify_screen.dart';
import 'package:frontend_mobile/utils/constant.dart';
import 'package:frontend_mobile/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registration(
      {required BuildContext context,
      required String username,
      required String password,
      required String email}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // trim input and convert to lowercase
      email = email.trim().toLowerCase();
      var response = await http.post(
        Uri.parse(APIEndPoint.baseUrl +
            APIEndPoint.version +
            APIEndPoint.authEndPoint.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {"email": email, "username": username, "password": password},
        ),
      );
      debugPrint("User provider: ");
      debugPrint(email);
      debugPrint(username);
      debugPrint(response.body);
      if (!context.mounted) return;

      getOTP(context: context, username: username, password: password);

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

  Future<void> getOTP({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    final otpProvider = Provider.of<OtpProvider>(context,
        listen: false); // Get the provider without rebuilding on changes
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      var response = await http.post(
          Uri.parse(APIEndPoint.baseUrl +
              APIEndPoint.version +
              APIEndPoint.authEndPoint.login),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
              {"username_or_email": username, "password": password}));
      debugPrint(response.body);
      if (!context.mounted) return;
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Email Sent!');
          final data = jsonDecode(response.body);
          String code = data['body']['code'] ?? 'non';
          print("Success $code");
          otpProvider.code = code; // Update the code in the Provider
          // Navigator.pushNamed(context, RouteManager.verifyScreen,
          // arguments: {'username': username, 'password': password});
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  VerifyPage(username: username, password: password)));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<TokenModel> getToken({
    required BuildContext context,
    required username,
  }) async {
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      debugPrint(username);
      debugPrint(otpProvider.code);

      var response = await http.post(
          Uri.parse(APIEndPoint.baseUrl +
              APIEndPoint.version +
              APIEndPoint.authEndPoint.getToken),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
              {'username_or_email': username, 'code': otpProvider.code}));
      if (!context.mounted) return tokenModelFromJson(response.toString());
      debugPrint(response.body);
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            debugPrint(response.body);
            Navigator.of(context)
                .pushReplacementNamed(RouteManager.navigationMenu);
          });
      return tokenModelFromJson(response.toString());
    } catch (e) {
      showSnackBar(context, e.toString());
      return Future.error(e.toString());
    }
  }
}

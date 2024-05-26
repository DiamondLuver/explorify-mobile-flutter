import 'package:flutter/material.dart';
import 'package:frontend_mobile/routes/route_manager.dart';

class InitApp {
  static void initializeApp(BuildContext context) async {
    Navigator.popAndPushNamed(context, RouteManager.loadingScreen);
  }

  static void loginApp(BuildContext context) async {
    Navigator.popAndPushNamed(context, RouteManager.loginScreen);
  }
}

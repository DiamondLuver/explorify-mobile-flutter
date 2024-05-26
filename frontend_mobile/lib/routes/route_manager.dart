import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/loading_screen.dart';
import 'package:frontend_mobile/screens/login_screen.dart';
import 'package:frontend_mobile/screens/register_screen.dart';
import 'package:frontend_mobile/screens/splash_screen.dart';
import 'package:frontend_mobile/screens/welcome_screen.dart';

class RouteManager {
  static const String splashScreen = '/';
  static const String loadingScreen = '/loading';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String welcomeScreen = '/welcome';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case loadingScreen:
        return MaterialPageRoute(builder: (context) => const LoadingPage());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case registerScreen:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomePage());
      default:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
    }
  }
}

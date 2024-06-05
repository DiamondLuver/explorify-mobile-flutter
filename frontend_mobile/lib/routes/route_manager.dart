import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/cv_generate/cv_generate_screen.dart';
import 'package:frontend_mobile/screens/home/home_screen.dart';
import 'package:frontend_mobile/screens/home/job_detail_screen.dart';
import 'package:frontend_mobile/screens/login/check_email.dart';
import 'package:frontend_mobile/screens/login/success_screen.dart';
import 'package:frontend_mobile/screens/login/verify_screen.dart';
import 'package:frontend_mobile/screens/onboarding/loading_screen.dart';
import 'package:frontend_mobile/screens/login/login_screen.dart';
import 'package:frontend_mobile/screens/login/register_screen.dart';
import 'package:frontend_mobile/screens/onboarding/splash_screen.dart';
import 'package:frontend_mobile/screens/onboarding/welcome_screen.dart';
import 'package:frontend_mobile/widget/navigation_menu.dart';

class RouteManager {
  static const String splashScreen = '/';
  static const String loadingScreen = '/loading';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String welcomeScreen = '/welcome';
  static const String homeScreen = '/home';
  static const String navigationMenu = '/navigation';
  static const String jobDetailScreen = '/jobDetail';
  static const String checkEmailScreen = '/checkEmil';
  static const String successScreen = '/success';
  static const String verifyScreen = '/verify';
  static const String cvGenerateScreen = '/cvGenertate';

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
      case navigationMenu:
        return MaterialPageRoute(builder: (context) => const NavigationMenu());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case jobDetailScreen:
        return MaterialPageRoute(builder: (context) => const JobDetailScreen());
      case checkEmailScreen:
        return MaterialPageRoute(builder: (context) => const CheckEmailPage());
      case successScreen:
        return MaterialPageRoute(builder: (context) => const SuccessPage());
      case verifyScreen:
        return MaterialPageRoute(builder: (context) => const VerifyPage());
      case cvGenerateScreen:
        return MaterialPageRoute(
            builder: (context) => const CVGenerateScreen());
      default:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
    }
  }
}

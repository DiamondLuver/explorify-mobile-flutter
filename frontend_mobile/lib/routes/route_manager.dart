import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/cv_generate/upload_cv_screen.dart';
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
import 'package:frontend_mobile/screens/profile/account_detail/about_me.dart';
import 'package:frontend_mobile/screens/profile/account_detail/add_appreciation.dart';
import 'package:frontend_mobile/screens/profile/account_detail/edit_language.dart';
import 'package:frontend_mobile/screens/profile/account_detail/language_main.dart';
import 'package:frontend_mobile/screens/profile/account_detail/skill.dart';
import 'package:frontend_mobile/screens/profile/acoount_screen.dart';
import 'package:frontend_mobile/screens/profile/account_detail/appreciation.dart';
import 'package:frontend_mobile/screens/profile/change_password.dart';
import 'package:frontend_mobile/screens/profile/edit_profile.dart';
import 'package:frontend_mobile/screens/profile/account_detail/education.dart';
import 'package:frontend_mobile/screens/profile/account_detail/select_language.dart';
import 'package:frontend_mobile/screens/profile/language.dart';
import 'package:frontend_mobile/screens/profile/profile_screen.dart';
import 'package:frontend_mobile/screens/profile/account_detail/work_experince.dart';
import 'package:frontend_mobile/screens/profile/team.dart';
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
  static const String profileScreen = '/profile';
  static const String accountScreen = '/profile/acoount_detail';
  static const String editProfileScreen = '/profile/edit_profile';
  static const String changePasswordScreen = '/profile/change_password';
  static const String aboutMeScreen = '/profile/account_detail/about_me';
  static const String workExperinceScreen =
      '/profile/account_detail/work_experince';
  static const String eduInfoScreen =
      '/profile/account_detail/education_information';
  static const String userLanguageScreen = '/profile/account_detail/language';
  static const String languageMainScreen =
      '/profile/account_detail/language_main';
  static const String editLanguageScreen =
      '/profile/account_detail/edit_language';
  static const String skillScreen = '/profile/account_detail/skill';
  static const String appreciationScreen = '/profile/appreciation';
  static const String addAppreciationScreen = '/profile/addAppreciation';
  static const String languageScreen = '/profile/language';
  static const String teamScreen = '/profile/team';

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
      // case verifyScreen:
      //   return MaterialPageRoute(builder: (context) => const VerifyPage());
      case cvGenerateScreen:
        return MaterialPageRoute(
            builder: (context) => const CVGenerateScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case accountScreen:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      case editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      case changePasswordScreen:
        return MaterialPageRoute(builder: (context) => const ChangePassword());
      case aboutMeScreen:
        return MaterialPageRoute(builder: (context) => const AboutMeScreen());
      case workExperinceScreen:
        return MaterialPageRoute(
            builder: (context) => const WorkExperinceScreen());
      case eduInfoScreen:
        return MaterialPageRoute(builder: (context) => const EduInfo());
      case userLanguageScreen:
        return MaterialPageRoute(
            builder: (context) => const UserLanguageScreen());
      case languageMainScreen:
        return MaterialPageRoute(
            builder: (context) => const LanguageMainScreen());
      case editLanguageScreen:
        return MaterialPageRoute(
            builder: (context) => const EditLanguageScreen());
      case skillScreen:
        return MaterialPageRoute(builder: (context) => const SkillScreen());
      case appreciationScreen:
        return MaterialPageRoute(
            builder: (context) => const AppreciationScreen());
      case addAppreciationScreen:
        return MaterialPageRoute(
            builder: (context) => const AddAppreciationScreen());
      case languageScreen:
        return MaterialPageRoute(builder: (context) => const LanguageScreen());
      case teamScreen:
        return MaterialPageRoute(builder: (context) => const TeamScreen());
      default:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
    }
  }
}

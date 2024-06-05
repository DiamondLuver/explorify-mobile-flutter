import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.onGenerateRoute,
      initialRoute: RouteManager.splashScreen,
      theme: ThemeData(
        fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColor.white,
        primaryColor: const Color.fromARGB(255, 145, 121, 102),
        secondaryHeaderColor: AppColor.secondary,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary),
          headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.accent),
          titleLarge: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.secondary,
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColor.secondary,
          ),
          titleSmall: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColor.accent),
          bodyLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColor.textPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: AppColor.textSecondary,
          ),
          bodySmall: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.normal,
            color: AppColor.textAccent,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            foregroundColor: AppColor.white,
            backgroundColor: AppColor.primary,
            disabledForegroundColor: AppColor.midGrey,
            disabledBackgroundColor: AppColor.midGrey,
            textStyle: const TextStyle(
                fontSize: 16,
                color: AppColor.white,
                fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
          ),
        ),
      ),
      // home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        scaffoldBackgroundColor: Color.fromRGBO(249, 249, 249, 1),
        primaryColor: Color(0xFFF27C1C),
        secondaryHeaderColor: Color(0xFF150B3D),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff404040)),
          headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff404040)),
          titleLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff404040),
          ),
          titleSmall: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xff666666)),
          bodyLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xff404040),
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Color(0xff666666),
          ),
          bodySmall: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.normal,
            color: Color(0xffAAA6B9),
          ),
        ),
      ),
      // home: const SplashScreen(),
    );
  }
}

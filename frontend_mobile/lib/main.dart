import 'package:flutter/material.dart';
import 'package:frontend_mobile/app.dart';
import 'package:frontend_mobile/screens/profile/widget/language_logic.dart';
import 'package:frontend_mobile/widget/navigation_menu.dart';
import 'package:provider/provider.dart';

// void main() => runApp(ChangeNotifierProvider(
//       create: (context) => NavigationProvider(),
//       child: const MyApp(),
//     ));

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavigationProvider()),
          ChangeNotifierProvider(create: (context) => LanguageLogic()),
        ],
        child: const MyApp(),
      ),
    );
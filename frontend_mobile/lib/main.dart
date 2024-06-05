import 'package:flutter/material.dart';
import 'package:frontend_mobile/app.dart';
import 'package:frontend_mobile/provider/apply.dart';
import 'package:frontend_mobile/widget/navigation_menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UploadState>(
              create: (context) => UploadState()),
          ChangeNotifierProvider<NavigationProvider>(
              create: (context) => NavigationProvider()),
        ],
        child: const MyApp(),
      ),
    );

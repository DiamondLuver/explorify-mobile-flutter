import 'dart:async';

import "package:flutter/material.dart";
import 'package:frontend_mobile/init.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(milliseconds: 2000), () {
      InitApp.loginApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/app_logo.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            RichText(
              text: TextSpan(
                  text: "Ex",
                  style: Theme.of(context).textTheme.displayLarge,
                  children: const [
                    TextSpan(
                      text: "plorify",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

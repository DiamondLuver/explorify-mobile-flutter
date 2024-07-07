import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.welcomeImg,
              width: 250,
            ),
            Config.spaceLarge,
            Text(
              AppText.enText['welcome-title']!,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Config.spaceSmall,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: AppText.enText['welcome-body']!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                        text: " Explorify",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
            Config.spaceLarge,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.preferenceScreen);
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(AppText.enText['welcome-button']!),
            ),
          ],
        ),
      ),
    );
  }
}

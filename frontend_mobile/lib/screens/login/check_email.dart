import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({
    super.key,
  });

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // curve style
                Image.asset(AppImage.upperStyle),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Config.spaceLarge,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40), // Space for the back button
                          Text(
                            AppText.enText['check_email_title']!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            AppText.enText['check_email_text']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Config.spaceLarge,
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImage.sendEmailImg,
                              width: 250,
                            ),
                          ),
                        ],
                      ),
                      Config.spaceLarge,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, RouteManager.successScreen);
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(AppText.enText['open_email_button']!),
                      ),
                      Config.spaceSmall,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, RouteManager.loginScreen);
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(AppText.enText['back_to_login_button']!),
                      ),
                      Config.spaceSmall,
                      Row(
                        // Add the Row widget here
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You haven't recived the email?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Resend",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 80,
              left: 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, RouteManager.loginScreen);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 7.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

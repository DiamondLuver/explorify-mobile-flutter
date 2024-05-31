import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    super.key,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
                            AppText.enText['success_title']!,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            AppText.enText['success_text']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Config.spaceLarge,
                          Config.spaceSmall,
                          Config.spaceSmall,
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImage.successImg,
                              width: 250,
                            ),
                          ),
                        ],
                      ),
                      Config.spaceLarge,
                      Config.spaceLarge,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, RouteManager.verifyScreen);
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(AppText.enText['continue_button']!),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

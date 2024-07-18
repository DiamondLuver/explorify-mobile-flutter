import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/screens/profile/widget/language_logic.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            Consumer<LanguageLogic>(
              builder: (context, languageLogic, child) {
                return CustomAccountAppBar(
                  
                  showBackArrow: true,
                  leadingIconColor: Colors.black,
                  title: Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Text(
                      languageLogic.lang.language,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 600, // Adjust the height as needed
                    child: Consumer<LanguageLogic>(
                      builder: (context, languageLogic, child) {
                        return ListView(
                          children: [
                            ListTile(
                              title: Text(languageLogic.lang.Engish),
                              trailing: languageLogic.langIndex == 1
                                  ? Icon(Icons.check)
                                  : null,
                              onTap: () {
                                context.read<LanguageLogic>().changeToEnglish();
                              },
                            ),
                            ListTile(
                              title: Text(languageLogic.lang.Khmer),
                              trailing: languageLogic.langIndex == 0
                                  ? Icon(Icons.check)
                                  : null,
                              onTap: () {
                                context.read<LanguageLogic>().changeToKhmer();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

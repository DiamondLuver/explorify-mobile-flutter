import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/appreciation_form.dart';

import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class AddAppreciationScreen extends StatefulWidget {
  const AddAppreciationScreen({super.key});

  @override
  State<AddAppreciationScreen> createState() => _AddAppreciationScreenState();
}

class _AddAppreciationScreenState extends State<AddAppreciationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            const Column(
              children: [
                CustomAccountAppBar(
                  showBackArrow: true,
                  leadingIconColor: Colors.black,
                  title: Row(
                    children: [
                      Text(
                        "Work Experience",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Add Work Experience",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      AppreciationForm(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/screens/profile/widget/working_form.dart';

class WorkExperinceScreen extends StatefulWidget {
  const WorkExperinceScreen({super.key});

  @override
  State<WorkExperinceScreen> createState() => _WorkExperinceScreenState();
}

class _WorkExperinceScreenState extends State<WorkExperinceScreen> {
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
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "Work Experience",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
                      WorkingForm(),
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

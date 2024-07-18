import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class LanguageMainScreen extends StatefulWidget {
  const LanguageMainScreen({super.key});

  @override
  State<LanguageMainScreen> createState() => _LanguageMainScreenState();
}

class _LanguageMainScreenState extends State<LanguageMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            const CustomAccountAppBar(
              showBackArrow: true,
              leadingIconColor: Colors.black,
              title: Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Language",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_rounded,
                          size: 24,
                          color: AppColor.primary,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteManager.userLanguageScreen);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //add language boxes
                  Row(
                    children: [
                      Container(
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  const Text(
                                    'Indonesian (First language)',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: AppColor.primary,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteManager.editLanguageScreen);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                'Oral: Level 10',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Written: Level 10',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  const Text(
                                    'English (Second language)',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: AppColor.primary,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteManager.editLanguageScreen);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                'Oral: Level 10',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Written: Level 10',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

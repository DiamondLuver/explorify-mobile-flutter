import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class EditLanguageScreen extends StatefulWidget {
  const EditLanguageScreen({super.key});

  @override
  State<EditLanguageScreen> createState() => _EditLanguageScreenState();
}

class _EditLanguageScreenState extends State<EditLanguageScreen> {
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
                        'Edit Language',
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                    'Indonesian (First language)',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.flag_circle_outlined,
                                    size: 20,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Divider(),
                              ),
                              Text(
                                "First language",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              )
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
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0),
                              Text(
                                "Oral",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              DropdownButtonFormField<String>(
                                value: "Beginner",
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "Beginner",
                                    child: Text('Beginner'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Intermediate",
                                    child: Text('Intermediate'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Advanced",
                                    child: Text('Advanced'),
                                  ),
                                ],
                                onChanged: (String? newValue) {
                                  // This callback function is triggered when the user selects a new value from the dropdown menu.
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: AppColor.grey, width: 2.0),
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Divider(),
                              ),
                              Text(
                                "Written Level",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              DropdownButtonFormField<String>(
                                value: "Beginner",
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "Beginner",
                                    child: Text('Beginner'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Intermediate",
                                    child: Text('Intermediate'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Advanced",
                                    child: Text('Advanced'),
                                  ),
                                ],
                                onChanged: (String? newValue) {
                                  // This callback function is triggered when the user selects a new value from the dropdown menu.
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: AppColor.grey, width: 2.0),
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

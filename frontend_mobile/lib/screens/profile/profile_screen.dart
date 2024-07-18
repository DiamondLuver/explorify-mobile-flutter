import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/cv_generate/resume_screen.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/home/widgets/section_heading.dart';
import 'package:frontend_mobile/screens/profile/faq_screen.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_divider.dart';
import 'package:frontend_mobile/screens/profile/widget/listing.dart';
import 'package:frontend_mobile/screens/profile/widget/profile_appBar.dart';
import 'package:frontend_mobile/utils/config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;
  bool _notiIsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header AppBar
            const PrimaryCustomContainer(
              child: Column(
                children: [
                  // -- APPBAR --
                  ProfileAppBar(),
                  Config.spaceSmall,
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //setting
            // const SizedBox(
            //   height: 5,
            // ),
            // user profile
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add left padding here
                    child: SectionHeading(
                      title: AppText.enText['profile']!,
                    ),
                  ),
                  Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        ProfileSetting(
                          icon: Icon(Icons.account_circle_outlined).icon ??
                              Icons.error,
                          title: 'Account Detail',
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.accountScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon:
                              Icon(Icons.language_outlined).icon ?? Icons.error,
                          title: 'Language',
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.languageScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon: Icon(Icons.work_outline).icon ?? Icons.error,
                          title: 'Resume',
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CVScreen(), // Pass the item here
                              ),
                            );
                          },
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //setting
            // user profile
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add left padding here
                    child: SectionHeading(
                      title: AppText.enText['setting']!,
                      //showActionButton: true,
                    ),
                  ),
                  Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        ProfileSetting(
                          icon: Icon(Icons.notifications_rounded).icon ??
                              Icons.error,
                          title: 'Notification',
                          trailing: Switch(
                            value: _notiIsOn, // Use the state variable
                            onChanged: (value) =>
                                setState(() => _notiIsOn = value),
                            activeColor: AppColor
                                .primary, // Customize color for on state (optional)
                            inactiveTrackColor: AppColor
                                .grey, // Customize color for off state (optional)
                          ),
                          onTap: () {},
                        ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon:
                              Icon(Icons.password_outlined).icon ?? Icons.error,
                          title: 'Change Password',
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.changePasswordScreen);
                          },
                        ),
                        // const CustomDivider(),
                        // ProfileSetting(
                        //   icon: Icon(Icons.dark_mode_outlined).icon ??
                        //       Icons.error,
                        //   title: 'Dark Mode',
                        //   trailing: Switch(
                        //     value: _isDarkMode, // Use the state variable
                        //     onChanged: (value) =>
                        //         setState(() => _isDarkMode = value),
                        //     activeColor: AppColor
                        //         .primary, // Customize color for on state (optional)
                        //     inactiveTrackColor: AppColor
                        //         .grey, // Customize color for off state (optional)
                        //   ),
                        //   onTap:
                        //       () {}, // Optional tap functionality for the entire setting
                        // ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon: Icon(Icons.policy_outlined).icon ?? Icons.error,
                          title: 'Terms and Conditions',
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.termAndConditionScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon: Icon(Icons.people_alt_rounded).icon ??
                              Icons.error,
                          title: 'Our Team',
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: AppColor.grey,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.teamScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileSetting(
                          icon: Icon(Icons.logout_outlined).icon ?? Icons.error,
                          title: 'Logout',
                          trailing: null,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.loginScreen);
                          },
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/profile/widget/account_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/profile_appBar.dart';
import 'package:frontend_mobile/utils/config.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                  Config.spaceMedium,
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            //list
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    color: AppColor.white,
                    child: const Column(
                      children: [
                        ProfileInfoBox(
                          icon: Icons.person,
                          title: 'About me',
                          trailing: Icon(
                            Icons.edit_note,
                            size: 24.0,
                            color: AppColor.primary,
                          ),
                          subTitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Work experience',
                          trailing: Icon(
                            Icons.edit_note,
                            size: 24.0,
                            color: AppColor.primary,
                          ),
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Education',
                          trailing: Icon(
                            Icons.edit_note,
                            size: 24.0,
                            color: AppColor.primary,
                          ),
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Skill',
                          trailing: Icon(
                            Icons.edit_note,
                            size: 24.0,
                            color: AppColor.primary,
                          ),
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

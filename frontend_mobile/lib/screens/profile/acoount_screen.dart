import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/screens/cv_generate/upload_cv_screen.dart';
import 'package:frontend_mobile/screens/home/services/cv_generate_service.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/profile/widget/account_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';
import 'package:frontend_mobile/screens/profile/widget/custome_listing.dart';
import 'package:frontend_mobile/screens/profile/widget/profile_appBar.dart';
import 'package:frontend_mobile/utils/config.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<CV>? cvInfo;
  late final CvGenerateService cvServicecs = CvGenerateService();

  @override
  void initState() {
    super.initState();
    fetchCVInfo();
  }

  fetchCVInfo() async {
    cvInfo = await cvServicecs.getCV(context);
  }

  Future<void> _handleRefresh() async {
    await fetchCVInfo();
    if (context.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImage.upperStyle),
            // Header AppBar
            CustomAccountAppBar(
              showBackArrow: true,
              leadingIconColor: Colors.black,
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "Account Detail",
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
              height: 24,
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        ProfileInfoBox(
                          icon: Icons.person,
                          title: 'About me',
                          subTitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.aboutMeScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Work experience',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.workExperinceScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.work,
                          title: 'Education',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.eduInfoScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(height: 30.0),
                        CustomeListing(
                          icon: Icons.person,
                          title: 'Skill',
                          subTitle:
                              'Leadership Teamwork Visioner Target oriented Consistent',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.skillScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        CustomeListing(
                          icon: Icons.language_outlined,
                          title: 'Language',
                          subTitle: 'English Koren Khmer Chinese',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.languageMainScreen);
                          },
                        ),
                        SizedBox(height: 30.0),
                        ProfileInfoBox(
                          icon: Icons.book_online_outlined,
                          title: 'Appreciation',
                          onTrailingTap: () {
                            Navigator.pushNamed(
                                context, RouteManager.appreciationScreen);
                          },
                          subTitle:
                              'Manager at Amazon Inc (Jan 2015 - Feb 2022)',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
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

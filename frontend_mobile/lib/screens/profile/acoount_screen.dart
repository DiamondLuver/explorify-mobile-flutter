import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/model/cv/cv_model.dart';
import 'package:frontend_mobile/screens/cv_generate/upload_cv_screen.dart';
import 'package:frontend_mobile/screens/home/services/cv_generate_service.dart';
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
    if (cvInfo != null && cvInfo!.isNotEmpty) {
      final cv = cvInfo![0];
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
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: Column(
                    children: [
                      Container(
                        color: AppColor.white,
                        child: Column(
                          children: [
                            ProfileInfoBox(
                              icon: Icons.person,
                              title: 'About me',
                              trailing: Icon(
                                Icons.edit_note,
                                size: 24.0,
                                color: AppColor.primary,
                              ),
                              subTitle: cv.cvId.toString() +
                                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.',
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
                            SizedBox(
                              height: 30,
                            ),
                            //button
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // Show a loading indicator or handle the case where data is not yet available
      return Center(child: CircularProgressIndicator());
    }
  }
}

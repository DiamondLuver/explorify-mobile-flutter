import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/home/job_detail_screen.dart';
import 'package:frontend_mobile/screens/home/widgets/category.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_card.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_notification.dart';
import 'package:frontend_mobile/screens/home/widgets/home_appBar.dart';
import 'package:frontend_mobile/screens/home/widgets/section_heading.dart';
import 'package:frontend_mobile/screens/home/widgets/search_bar.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:frontend_mobile/widget/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.withOpacity(.4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header AppBar
            PrimaryCustomContainer(
              child: Column(
                children: [
                  // -- APPBAR --
                  const HomeAppBar(),
                  Config.spaceMedium,
                  // -- Search --
                  // SearchContainer(
                  //   text: AppText.enText['search-text']!,
                  // ),
                  // -- Search --
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteManager.search);
                    },
                    child: Hero(
                      tag: 'search-bar',
                      child: SearchContainer(
                        text: AppText.enText['search-text'] ?? 'Search...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            //-- Body --
            // --CATEGORY--
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  SectionHeading(title: AppText.enText['findjob-text']!),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 118,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const VerticleImage(
                            title: 'Title',
                            subTitle: '11 Jobs',
                            image: AppImage.logo,
                          );
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            // -- LIST OF JOB --
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  SectionHeading(
                    title: AppText.enText['recommended-text']!,
                    showActionButton: true,
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomCardInfo(
                            jobImage: AppImage.google,
                            jobType: "Full Time",
                            companyName: "Google Inc",
                            positionName: "UX/UI Designer",
                            location: "California, USA",
                            minSalary: 200,
                            maxSalry: 400,
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, RouteManager.jobDetailScreen);
                            },
                          );
                        }),
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

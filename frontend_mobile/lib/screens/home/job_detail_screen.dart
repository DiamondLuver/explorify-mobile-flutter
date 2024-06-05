import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/provider/apply.dart';
import 'package:frontend_mobile/screens/cv_generate/cv_generate_screen.dart';
import 'package:frontend_mobile/screens/home/widgets/apply_button.dart';
import 'package:frontend_mobile/screens/home/widgets/tab_bar.dart';
import 'package:frontend_mobile/screens/home/widgets/text_tile.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';
import 'package:frontend_mobile/screens/home/widgets/job_info.dart';
import 'package:frontend_mobile/screens/home/widgets/company_info.dart';
import 'package:provider/provider.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  bool isUpload = false;
  @override
  Widget build(BuildContext context) {
    final uploadState = Provider.of<UploadState>(context);
    List<String> tabs = ['Job Description', 'About Company'];
    return Scaffold(
      floatingActionButton: const ApplyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------APP BAR--------

            Image.asset(AppImage.upperStyle),
            CustomAppBar(
              isCenter: true,
              showBackArrow: true,
              title: Text(
                AppText.enText['job_detail_title']!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              action: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            // -------COMPANY NAME--------

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/app_logo.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Company Name",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Job Position",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.secondary),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Location",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: AppColor.midGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            // -------CATEGORY--------

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 37,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: TextTile(
                        title: 'Cambodia',
                      ),
                    );
                  },
                ),
              ),
            ),
            Config.spaceSmall,

            // -------TAB BAR & TAB VIEW--------
            uploadState.isUpload
                ? const SizedBox(height: 300, child: CVGenerateScreen())
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: AppColor.buttonSecondary,
                          ),
                          child: DescriptionTab(
                            tabs: tabs,
                            tabController: tabController,
                          ),
                        ),
                      ),
                      Config.spaceMedium,

                      // ----TAB VIEW----
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          controller: tabController,
                          children: const [JobInfo(), CompanyInfo()],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

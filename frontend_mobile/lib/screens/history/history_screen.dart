import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/history/widgets/articles_saved.dart';
import 'package:frontend_mobile/screens/history/widgets/internship_apply_history.dart';
import 'package:frontend_mobile/screens/history/widgets/internship_save_history.dart';
import 'package:frontend_mobile/screens/home/widgets/tab_bar.dart';
import 'package:frontend_mobile/widget/app_bar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Applied', 'Saved', 'Article Saved'];
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------APP BAR--------
          Image.asset(AppImage.upperStyle),
          CustomAppBar(
            isCenter: true,
            showBackArrow: true,
            title: Text(
              "History",
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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Container(
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                InternshipApplyScreen(),
                InternshipSavedScreen(),
                ArticleSavedScreen(), // Added new screen for articles
              ],
            ),
          ),
        ],
      ),
    );
  }
}

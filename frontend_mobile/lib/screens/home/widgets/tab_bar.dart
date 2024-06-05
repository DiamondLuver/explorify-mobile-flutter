import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({
    super.key,
    required this.tabs,
    required this.tabController,
  });
  final TabController tabController;
  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: TabBar(
            labelColor: AppColor.white,
            unselectedLabelColor: AppColor.secondary,
            indicatorColor: AppColor.white,
            indicatorWeight: 2,
            dividerHeight: 0,
            labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12,
                ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(48),
            ),
            controller: tabController,
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            // onTap: (index) {},
          ),
        ),
      ],
    );
  }
}

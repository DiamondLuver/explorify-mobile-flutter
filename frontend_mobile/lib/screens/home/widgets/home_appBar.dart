
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_notification.dart';
import 'package:frontend_mobile/utils/config.dart';
import 'package:frontend_mobile/widget/app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/welcome_img.png",
              width: 54,
              height: 54,
            ),
          ),
          Config.spaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.enText['appBar-title']!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.white),
              ),
              Text(
                AppText.enText['appBar-subTitle']!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColor.white),
              ),
            ],
          ),
        ],
      ),
      action: [
        CustomIcon(
          onPressed: () {},
          iconColor: AppColor.black,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/profile/widget/costom_appBar.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          CustomProfileAppBar(
            showBackArrow: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 2),
                Text(
                  "Your Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColor.white),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/profile_img.png",
                  width: 78,
                  height: 82,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.enText['profile_name']!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.white),
                  ),
                  Text(
                    AppText.enText['profile_email']!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Country",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.white),
                  ),
                  SizedBox(width: 60),
                  Text(
                    "Job Title",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.white),
                  ),
                  SizedBox(width: 60),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteManager.editProfileScreen);
                    },
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.2), // Transparent white color
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColor.white),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.edit,
                            color: AppColor.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

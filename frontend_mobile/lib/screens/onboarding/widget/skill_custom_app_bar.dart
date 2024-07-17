import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/routes/route_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed,
      this.isCenter = false,
      this.hasBg = false});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final bool isCenter;
  final bool hasBg;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!hasBg)
          Container(
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.upperStyle),
                fit: BoxFit.cover,
              ),
            ),
          ),
        AppBar(
          automaticallyImplyLeading: false,
          centerTitle: isCenter,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, RouteManager.navigationMenu);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 14,
                    color: hasBg ? AppColor.white : AppColor.black,
                  ),
                )
              : leadingIcon != null
                  ? IconButton(
                      onPressed: () {
                        if (leadingOnPressed != null) {
                          leadingOnPressed!();
                        }
                      },
                      icon: Icon(
                        leadingIcon,
                        size: 14,
                        color: AppColor.white,
                      ),
                    )
                  : null,
          title: title,
          actions: action,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+50);
}

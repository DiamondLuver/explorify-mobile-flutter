import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/utils/config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed,
      this.isCenter = false});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: isCenter ? 0 : 68),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: isCenter,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, RouteManager.navigationMenu);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Colors.white,
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
                      color: Colors.white,
                    ),
                  )
                : null,
        title: title,
        actions: action,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(243.0);
}

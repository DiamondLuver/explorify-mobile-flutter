import 'package:flutter/material.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomProfileAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
    this.leadingIconColor = Colors.white, // Add this line
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final Color leadingIconColor; // Add this line

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: leadingIconColor, // Change this line
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
                      size: 20,
                      color: leadingIconColor, // Change this line
                    ),
                  )
                : null,
        title: title,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(243.0);
}

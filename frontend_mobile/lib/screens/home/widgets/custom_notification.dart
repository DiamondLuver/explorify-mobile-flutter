import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteManager.notificationScreen);
          },
          borderRadius: BorderRadius.circular(200),
          child: Container(
            height: 54,
            width: 54,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColor.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.notifications,
              color: iconColor,
              size: 24,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: AppColor.error,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "1",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: AppColor.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

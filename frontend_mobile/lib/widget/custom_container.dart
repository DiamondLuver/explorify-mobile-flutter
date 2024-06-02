
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.background = AppColor.white,
    required this.circleColor,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color background;
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: circleColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: child,
    );
  }
}

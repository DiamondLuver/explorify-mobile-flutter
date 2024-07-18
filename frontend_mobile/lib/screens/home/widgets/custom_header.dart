import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/widget/custom_container.dart';

class PrimaryCustomContainer extends StatelessWidget {
  const PrimaryCustomContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: Stack(
          children: [
            Positioned(
              left: -170,
              top: -150,
              child: CustomContainer(
                circleColor: AppColor.appbBarColor.withOpacity(.2),
              ),
            ),
            Positioned(
              left: -90,
              top: -150,
              child: CustomContainer(
                circleColor: AppColor.appbBarColor.withOpacity(.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

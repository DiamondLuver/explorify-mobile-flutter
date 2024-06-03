import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        color: AppColor.grey.withOpacity(0.5),
      ),
    );
  }
}

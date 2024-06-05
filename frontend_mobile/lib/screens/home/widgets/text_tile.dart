import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.buttonSecondary,
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}

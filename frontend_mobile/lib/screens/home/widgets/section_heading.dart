import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'See More',
    this.textColor,
    this.showActionButton = false,
    this.onPressed,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColor.secondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            TextButton(
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: AppColor.primary),
              ),
            ),
        ],
      ),
    );
  }
}

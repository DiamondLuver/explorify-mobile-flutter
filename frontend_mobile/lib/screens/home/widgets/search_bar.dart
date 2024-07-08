import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: MediaQuery.of(context).size.width, // *.7
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.midGrey),
            )
          ],
        ),
      ),
    );
  }
}

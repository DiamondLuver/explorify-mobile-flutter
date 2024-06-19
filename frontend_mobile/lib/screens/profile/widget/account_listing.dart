import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class ProfileInfoBox extends StatelessWidget {
  const ProfileInfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTrailingTap,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 24.0,
                      color: AppColor.primary,
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: onTrailingTap,
                      child: Icon(
                        Icons.edit_note,
                        size: 24.0,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                Divider(),
                const SizedBox(height: 4.0),
                Text(subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


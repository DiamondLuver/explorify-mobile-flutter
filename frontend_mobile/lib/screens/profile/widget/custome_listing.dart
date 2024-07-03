// // profile_info_box.dart
// import 'package:flutter/material.dart';
// import 'package:frontend_mobile/common/colors.dart';
// import 'package:frontend_mobile/screens/profile/widget/text_styles.dart';

// class CustomeListing extends StatelessWidget {
//   const CustomeListing({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subTitle,
//     required this.onTrailingTap,
//   });

//   final IconData icon;
//   final String title;
//   final String subTitle;
//   final VoidCallback onTrailingTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             icon,
//             size: 24.0,
//             color: AppColor.primary,
//           ),
//           const SizedBox(width: 16.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       title,
//                       style: AppTextStyle.titleStyle,
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                       onTap: onTrailingTap,
//                       child: Icon(
//                         Icons.edit_note,
//                         size: 24.0,
//                         color: AppColor.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(),
//                 const SizedBox(height: 4.0),
//                 Text(subTitle, style: AppTextStyle.subTitleStyle),
//                 const SizedBox(height: 8.0),
//                 GestureDetector(
//                   onTap: onTrailingTap,
//                   child: Text('See more', style: AppTextStyle.buttonTextStyle),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// profile_info_box.dart
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/profile/widget/text_styles.dart';

class CustomeListing extends StatelessWidget {
  const CustomeListing({
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
          Icon(
            icon,
            size: 24.0,
            color: AppColor.primary,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.titleStyle,
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
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: subTitle.split(' ').map((word) {
                    return InkWell(
                      //onTap: onTrailingTap,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          word,
                          style: AppTextStyle.subTitleStyle
                              .copyWith(decoration: TextDecoration.none),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: onTrailingTap,
                  child: Text('See more', style: AppTextStyle.buttonTextStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

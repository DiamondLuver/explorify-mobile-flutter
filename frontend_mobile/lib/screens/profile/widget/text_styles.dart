// // text_styles.dart
// import 'package:flutter/material.dart';

// class AppTextStyle {
//   static const TextStyle titleStyle = TextStyle(
//     fontSize: 16.0,
//     fontWeight: FontWeight.bold,
//   );

//   static const TextStyle subTitleStyle = TextStyle(
//     fontSize: 14.0,
//     color: Colors.grey,
//   );

//   static const TextStyle buttonTextStyle = TextStyle(
//     fontSize: 14.0,
//     color: Colors.orange,
//     fontWeight: FontWeight.bold,
//   );
// }

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class AppTextStyle {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitleStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColor.primary,
    fontWeight: FontWeight.bold,
  );
}

import 'package:flutter/material.dart';
import 'package:frontend_mobile/utils/config.dart';

InputDecoration formDecoration(String labelText, IconData iconData) {
  return InputDecoration(
      errorStyle: const TextStyle(fontSize: 10),
      prefixIcon: Icon(
        iconData,
        color: Colors.black,
      ),
      errorMaxLines: 3,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      enabledBorder: Config.outlinedBorder,
      focusedBorder: Config.focusBorder,
      errorBorder: Config.errorBorder);
}

// const enabledBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(12),
//     ),
//     borderSide: BorderSide(width: 1, color: Colors.orange));

// const focusedBorder = UnderlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(12),
//     ),
//     borderSide: BorderSide(width: 2, color: Colors.orange));

// const errorBorder = UnderlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(10),
//     ),
//     borderSide: BorderSide(width: 1, color: Colors.red));

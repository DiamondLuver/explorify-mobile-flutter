//set const here
import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  //define space height
  static const spaceSmall = SizedBox(height: 24);
  static const spaceMedium = SizedBox(height: 32);
  static const spaceLarge = SizedBox(height: 48);
  static const appBarHeight = SizedBox(height: 56);

  //textform field border
  static const outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 1, color: Colors.black));

  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.orange,
      ));

  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));
  static const primaryColor = Colors.greenAccent;
}

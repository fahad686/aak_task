// app color constants

import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class ColorConstants {
  //basics colours
    static const white = Color(0xFFFFFFFF);
    static const black = Color(0xFF000000);
    static const red = Color(0xffED1C24);

  //App theme colours
  static Color primary = CustomColor.fromHex("#ED1C24");
  static Color secondary = CustomColor.fromHex("#ED1C24");
  static Color scaffoldColor=white.withOpacity(0.95);
  // static Color secondary = CustomColor.fromHex("#1ecfc2");

  static Color APP_TEXT_BLUE = CustomColor.fromHex("#5f89bc");
  static Color DEFAULT_TEXT_COLOR = CustomColor.fromHex("#808080");
  static Color profilePlaceholderColor = CustomColor.fromHex("#8B8C8D66");
  static Color dividerColor = CustomColor.fromHex("#EEEEEE");

  static Color hexToColor(String? code) {
    //print(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
    return Color(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
  }


  //Risk Management
    static Color rmPrimary =
    CustomColor.fromHex("#0EC4CB");
    static Color rmTitleText=CustomColor.fromHex('#262626');
    static Color rmBlackText=Colors.black;

    static Color rmDescriptionText=CustomColor.fromHex('#262626');
    static Color rmBackground = CustomColor.fromHex('#F7F7F7');
    static Color rmCardBackground = Colors.white;
    static Color rmDrawerSecondary = CustomColor.fromHex("#039EA4");
    static Color rmGreyBackground = CustomColor.fromHex("#F7F7F7");
    static Color rmGreyColor = CustomColor.fromHex("#F2F2F2");
    static Color rmGreenColor = Colors.green;
    static Color rmRedColor = Colors.red;

  //Extra's
  static const grey = Colors.grey;
  static const blue = Colors.blue;
  static const inputColor = Colors.white;
  static const drawerTextColor = Colors.black;
  static const transparent = Colors.transparent;
  static const buttonSky = Color(0xFF54c1ef);
  static const skyDark = Color.fromARGB(255, 125, 189, 225);
  static const sky = Color.fromARGB(255, 224, 244, 255);
  static const greyTextDark = Color(0xFF8d8d8d);
  static Color buttonBlue = secondary;
  static const feedbackContainerColor = Color(0xFFEAEAEA);
}

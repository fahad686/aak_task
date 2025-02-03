import 'package:flutter/material.dart';

class AppConstants {
  //app title
  static const appName = 'aak_tele';
  // rm Title style

  static const fontFamily='Manrope';

  
  // styles
  static TextStyle heading1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily
  );


  static TextStyle heading2 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily
  );

  static TextStyle heading22 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily
  );
  static TextStyle heading3 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle heading1_with_gray_color = const TextStyle(
    fontSize: 13,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  static bool isTablet=false;

  static const phoneNumber = 'phoneNumber';
  static const userId = 'userId';
  static const loginToken = 'loginToken';
  static const isLoggedIn = 'isLoggedIn';
  static const userName = 'userName';
  static const profileImage = "profileImage";



  //Image Path


}


import 'package:flutter/material.dart';

class AppColor {
  static const Color appWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color appBlack = Color(0xFF232323);
  static const Color appBlue = Color(0xFF337EFE);
  static const Color appStrokeGrey = Color.fromARGB(255, 227, 227, 231);
  static const Color appGrey = Color(0xFFA1A1A1);
  static const Color appDarkGrey = Color(0xFF545563);
  static const Color appHanPurple = Color(0xFF6427FF);
  static const Color appPrimaryColor = Color(0xFF4E60FF);
  static const Color appSecondaryColor = Color(0xFF15228F);
  static const Color appPrimaryCardColor = Color(0xFFFFFFFF);
  static const Color appSecondaryCardColor = Color(0xFFF3F4FF);
  static const Color appTertiaryCardColor = Color(0xFFF9F9FC);
  static const Color appSecondaryTextColor = Color(0xFF686C73);
  static const Color appBackgroundColor = Color(0xFFFFFFFF);
  static const Color primaryColorDark = Color(0xFF1672EC);
  static const Color accentColor = Color(0xFF1672EC);
  static const Color accentColorLight = Color(0xFFC2EFD0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColorDark, appPrimaryColor],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static final BoxShadow primaryBoxShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.05),
    blurRadius: 10.0,
    offset: const Offset(2.0, 2.0),
  );
}

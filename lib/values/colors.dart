import 'package:flutter/material.dart';

class AppColors {
  // needed for transparent gradient, Colors.transparent is black transparent
  static const Color whiteTransparent = Color(0x00ffffff);

  // Primary material color
  // Easy way to turn any color to Material Color
  // https://medium.com/py-bits/turn-any-color-to-material-color-for-flutter-d8e8e037a837
  static const Color primary = blueGreen800;
  static Map<int, Color> colorPrimaryCodes = {
    50: primary.withOpacity(0.1),
    100: primary.withOpacity(0.2),
    200: primary.withOpacity(0.3),
    300: primary.withOpacity(0.4),
    400: primary.withOpacity(0.5),
    500: primary.withOpacity(0.6),
    600: primary.withOpacity(0.7),
    700: primary.withOpacity(0.8),
    800: primary.withOpacity(0.9),
    900: primary,
  };
  static MaterialColor primaryColor =
      MaterialColor(primary.value, colorPrimaryCodes);

  // other colors
  static const Color blueGreen800 = Color(0xFF008a8e);
  static const Color blueGray = Color(0xFF9dafbe);
  static const Color blueGrayPlaceholder = Color(0xFFc5d0d9);
  static const Color dandelion = Color(0xFFffda11);
  static const Color blackTwo = Color(0xFF292929);
  static const Color black = Color(0xFF2e2e2e);
  static const Color darkBlue = Color(0xFF032e42);
  static const Color grass = Color(0xFF46bd30);
  static const Color strawberry = Color(0xFFf02c43);
  static const Color lightBlue = Color(0xFF7cc0dd);
  static const Color lightBlueGray = Color(0xFFe6ecf0);
  static const Color twilightBlue = Color(0xFF06436f);
  static const Color twilightBlue5 = Color(0x0c06436f);
  static const Color twilightBlue50 = Color(0x8006436f);
  static const Color twilightBlue54 = Color(0x8A06436f);
  static const Color mediumGray = Color(0xFF7892a5);
  static const Color lightGray = Color(0xfff8fbfc);
}

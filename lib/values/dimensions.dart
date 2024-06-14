import 'package:flutter/widgets.dart';

class AppDimensions {
  static const double checkBoxBorderRadius = 4;

  /// CARD
  static const double borderRadius = 10;
  static BorderRadiusGeometry circularBorderRadius =
      BorderRadius.circular(borderRadius);

  /// BUTTONS
  static const double buttonRadius = borderRadius;
  static const double buttonPadding = 16;
  static const EdgeInsets edgeButtonInnerPadding =
      EdgeInsets.all(buttonPadding);
  static RoundedRectangleBorder buttonRoundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: circularBorderRadius);
}

import 'package:flutter/material.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/core/values/colors.dart';

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    color: AppColors.black,
    fontSize: 40,
    fontFamily: Fonts.bold,
  );
  static const TextStyle h2 = TextStyle(
    color: AppColors.black,
    fontSize: 40,
    fontFamily: Fonts.bold,
  );
  static const TextStyle h3 = TextStyle(
    color: AppColors.black,
    fontSize: 22,
    fontFamily: Fonts.bold,
  );
  static const TextStyle h4 = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontFamily: Fonts.bold,
  );
  static const TextStyle h5 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontFamily: Fonts.bold,
  );
  static const TextStyle h6 = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontFamily: Fonts.bold,
  );
  static const TextStyle formLabel = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontFamily: Fonts.bold,
  );
  static const TextStyle errorLabel = TextStyle(
    color: AppColors.strawberry,
    fontSize: 12,
    fontFamily: Fonts.regular,
  );
  static const TextStyle bottomNavigationBarLabelUnselected = TextStyle(
    color: AppColors.blueGray,
    fontSize: 8,
    fontFamily: Fonts.bold,
  );
  static const TextStyle bottomNavigationBarLabelSelected = TextStyle(
    color: AppColors.black,
    fontSize: 8,
    fontFamily: Fonts.bold,
  );
}

class AppStyle {
  /// GRADIENT
  static BoxDecoration boxWithBackgroundGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColors.whiteTransparent,
        Colors.white,
        Colors.white,
      ],
    ),
  );

  /// SHADOWS
  static List<BoxShadow> containerShadows = const [
    BoxShadow(
      color: AppColors.twilightBlue,
      offset: Offset(0, 6),
      blurRadius: 7,
    ),
    BoxShadow(
      color: AppColors.twilightBlue,
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  /// TEXT INPUT
  /// TEXT FORM FIELD, INPUT DECORATION
  static const InputDecoration inputDecoration = InputDecoration(
    labelStyle: AppTextStyles.formLabel,
    hintStyle: AppTextStyles.formLabel,
    helperStyle: AppTextStyles.formLabel,
    errorStyle: AppTextStyles.errorLabel,
    filled: true,
    fillColor: AppColors.lightGray,
    border: inputUnderline,
    enabledBorder: inputUnderline,
    focusedBorder: inputUnderline,
    errorBorder: inputUnderlineError,
    focusedErrorBorder: inputUnderlineError,
    helperMaxLines: 2,
  );

  static const UnderlineInputBorder inputUnderline = UnderlineInputBorder();

  static const UnderlineInputBorder inputUnderlineError = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  );
}

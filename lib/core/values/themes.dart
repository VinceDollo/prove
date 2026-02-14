import 'package:flutter/material.dart';
import 'package:flutter_starter/assets.dart';
import 'package:flutter_starter/values/colors.dart';
import 'package:flutter_starter/values/dimensions.dart';
import 'package:flutter_starter/values/styles.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final lightBase = ThemeData.light();

    final lightTextTheme = lightBase.textTheme.copyWith(
      // headline1: AppTextStyles.headline1,
      // headline2: AppTextStyles.headline2,
      // headline3: AppTextStyles.headline3,
      // headline4: AppTextStyles.headline4,
      // headline5: AppTextStyles.headline5,
      titleLarge: AppTextStyles.h6,
      // subtitle1: AppTextStyles.subtitle1,
      // subtitle2: AppTextStyles.subtitle2,
      // bodyText1: AppTextStyles.body1,
      // bodyText2: AppTextStyles.body2,
      // button: AppTextStyles.button,
      // caption: AppTextStyles.caption,
      // overline: AppTextStyles.overline
    );

    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.blueGray,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: AppTextStyles.bottomNavigationBarLabelUnselected,
        selectedLabelStyle: AppTextStyles.bottomNavigationBarLabelSelected,
      ),
      primarySwatch: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      unselectedWidgetColor: Colors.grey,
      fontFamily: Fonts.regular,
      textTheme: lightTextTheme,
      // buttonTheme: ButtonThemeData(
      //   padding: AppDimensions.edgeButtonInnerPadding,
      //   shape: AppDimensions.buttonRoundedRectangleBorder,
      // ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all<Color>(Colors.grey),
        fillColor: WidgetStateProperty.all<Color>(Colors.white),
        side: const BorderSide(color: Colors.grey),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ).copyWith(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.blueGray;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.blueGray;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.blueGray;
          }
          return null;
        }),
        trackColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.blueGray;
          }
          return null;
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/assets/assetsGen/fonts.gen.dart';
import 'package:flutter_starter/core/values/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── Display ───────────────────────────────────────────────────────────────

  static const TextStyle displayLarge = TextStyle(
    fontSize: 36,
    fontFamily: FontFamily.bold,
    height: 1.2,
  );

  // ── Headline ──────────────────────────────────────────────────────────────

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28,
    fontFamily: FontFamily.bold,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 22,
    fontFamily: FontFamily.bold,
    height: 1.3,
  );

  // ── Title ─────────────────────────────────────────────────────────────────

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontFamily: FontFamily.bold,
    height: 1.35,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontFamily: FontFamily.bold,
    height: 1.4,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.bold,
    height: 1.4,
  );

  // ── Body ──────────────────────────────────────────────────────────────────

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.regular,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontFamily: FontFamily.regular,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontFamily: FontFamily.regular,
    height: 1.5,
  );

  // ── Label ─────────────────────────────────────────────────────────────────

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontFamily: FontFamily.bold,
    letterSpacing: 0.5,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontFamily: FontFamily.bold,
    height: 1.3,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontFamily: FontFamily.regular,
    height: 1.3,
  );

  // ── Semantic — color is part of the meaning ───────────────────────────────

  /// Always rendered in [AppColors.error]. Use for inline validation messages.
  static const TextStyle errorLabel = TextStyle(
    color: AppColors.error,
    fontSize: 12,
    fontFamily: FontFamily.regular,
    height: 1.3,
  );

  // ── Navigation ── font metrics only; color set by BottomNavigationBarTheme ─

  static const TextStyle bottomNavLabel = TextStyle(
    fontSize: 10,
    fontFamily: FontFamily.regular,
  );

  static const TextStyle bottomNavLabelSelected = TextStyle(
    fontSize: 10,
    fontFamily: FontFamily.bold,
  );
}

/// Shared decorations that adapt to the active [ColorScheme].
class AppStyle {
  AppStyle._();

  // ── Gradient ──────────────────────────────────────────────────────────────

  /// Top-to-bottom fade using the theme's surface color.
  /// Usage: `decoration: AppStyle.fadeGradient(Theme.of(context).colorScheme)`
  static BoxDecoration fadeGradient(ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;
    final transparent = isDark ? AppColors.darkSurfaceTransparent : AppColors.lightSurfaceTransparent;
    final surface = colorScheme.surface;
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [transparent, surface, surface],
      ),
    );
  }

  // ── Shadows ───────────────────────────────────────────────────────────────

  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 6),
      blurRadius: 8,
    ),
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> cardShadowStrong = [
    BoxShadow(
      color: AppColors.shadowStrong,
      offset: Offset(0, 8),
      blurRadius: 16,
    ),
  ];
}

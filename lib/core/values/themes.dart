import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/core/assets/assetsGen/fonts.gen.dart';
import 'package:flutter_starter/core/values/colors.dart';
import 'package:flutter_starter/core/values/dimensions.dart';
import 'package:flutter_starter/core/values/styles.dart';

/// Entry point for all app themes.
///
/// Usage in [MaterialApp]:
/// ```dart
/// theme:      AppTheme.light(),
/// darkTheme:  AppTheme.dark(),
/// themeMode:  ThemeMode.system,
/// ```
///
/// To add a third theme (e.g. a brand theme), define a new [ColorScheme]
/// constant and expose `static ThemeData brand() => _build(_brandScheme)`.
class AppTheme {
  AppTheme._();

  // ── Public factories ──────────────────────────────────────────────────────

  static ThemeData light() => _build(_lightScheme);
  static ThemeData dark() => _build(_darkScheme);

  // ── Color schemes ─────────────────────────────────────────────────────────

  // Light: black on white
  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    onPrimaryContainer: AppColors.lightOnPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    surfaceContainerHighest: AppColors.lightSurfaceVariant,
    onSurfaceVariant: AppColors.lightOnSurfaceVariant,
    outline: AppColors.lightOutline,
    outlineVariant: AppColors.lightOutlineVariant,
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,
    shadow: AppColors.shadow,
    scrim: AppColors.black,
    inverseSurface: AppColors.lightInverseSurface,
    onInverseSurface: AppColors.lightOnInverseSurface,
    inversePrimary: AppColors.lightInversePrimary,
  );

  // Dark: white on black
  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    surfaceContainerHighest: AppColors.darkSurfaceVariant,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,
    outline: AppColors.darkOutline,
    outlineVariant: AppColors.darkOutlineVariant,
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkOnErrorContainer,
    shadow: AppColors.shadowStrong,
    scrim: AppColors.black,
    inverseSurface: AppColors.darkInverseSurface,
    onInverseSurface: AppColors.darkOnInverseSurface,
    inversePrimary: AppColors.darkInversePrimary,
  );

  // ── Shared builder ────────────────────────────────────────────────────────

  static ThemeData _build(ColorScheme cs) {
    final isDark = cs.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      brightness: cs.brightness,
      primaryColor: cs.primary,
      scaffoldBackgroundColor: cs.surface,
      canvasColor: cs.surface,
      cardColor: isDark ? cs.surfaceContainerHighest : cs.surface,
      dividerColor: cs.outlineVariant,
      fontFamily: FontFamily.regular,

      // ── Text ──────────────────────────────────────────────────────────────
      textTheme: _buildTextTheme(cs),

      // ── AppBar ────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: cs.surface,
        foregroundColor: cs.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        titleTextStyle: AppTextStyles.titleSmall.copyWith(
          color: cs.onSurface,
          fontFamily: FontFamily.bold,
        ),
        iconTheme: IconThemeData(color: cs.onSurface),
        actionsIconTheme: IconThemeData(color: cs.onSurface),
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),

      // ── Card ──────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: isDark ? cs.surfaceContainerHighest : cs.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          side: BorderSide(color: cs.outlineVariant),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Input ─────────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextStyles.labelMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        helperStyle: AppTextStyles.labelSmall.copyWith(
          color: cs.onSurfaceVariant,
        ),
        errorStyle: AppTextStyles.errorLabel,
        filled: true,
        fillColor: cs.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(color: cs.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(color: cs.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(color: cs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          borderSide: BorderSide(color: cs.error, width: 1.5),
        ),
        helperMaxLines: 2,
        errorMaxLines: 2,
      ),

      // ── Elevated Button ───────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          disabledBackgroundColor: cs.onSurface.withValues(alpha: 0.12),
          disabledForegroundColor: cs.onSurface.withValues(alpha: 0.38),
          textStyle: AppTextStyles.labelLarge,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingM,
          ),
        ),
      ),

      // ── Outlined Button ───────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cs.primary,
          disabledForegroundColor: cs.onSurface.withValues(alpha: 0.38),
          textStyle: AppTextStyles.labelLarge,
          side: BorderSide(color: cs.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingM,
          ),
        ),
      ),

      // ── Text Button ───────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: cs.primary,
          textStyle: AppTextStyles.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          ),
        ),
      ),

      // ── Bottom Navigation ─────────────────────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cs.surface,
        selectedItemColor: cs.primary,
        unselectedItemColor: cs.onSurfaceVariant,
        unselectedLabelStyle: AppTextStyles.bottomNavLabel.copyWith(
          color: cs.onSurfaceVariant,
        ),
        selectedLabelStyle: AppTextStyles.bottomNavLabelSelected.copyWith(
          color: cs.primary,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // ── Navigation Bar (M3) ───────────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: cs.surface,
        indicatorColor: cs.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: cs.onPrimaryContainer);
          }
          return IconThemeData(color: cs.onSurfaceVariant);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.bottomNavLabelSelected.copyWith(
              color: cs.onSurface,
            );
          }
          return AppTextStyles.bottomNavLabel.copyWith(
            color: cs.onSurfaceVariant,
          );
        }),
        elevation: 0,
      ),

      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: cs.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // ── Checkbox ──────────────────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (s) => _resolveActive(s, cs.primary),
        ),
        checkColor: WidgetStateProperty.all(cs.onPrimary),
        side: BorderSide(color: cs.outline),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),

      // ── Radio ─────────────────────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (s) => _resolveActive(s, cs.primary),
        ),
      ),

      // ── Switch ────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => _resolveActive(s, cs.onPrimary),
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => _resolveActive(s, cs.primary),
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (s) => _resolveActive(s, cs.primary) ?? cs.outline,
        ),
      ),

      // ── Chip ──────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: cs.surfaceContainerHighest,
        labelStyle: AppTextStyles.labelMedium.copyWith(color: cs.onSurface),
        side: BorderSide(color: cs.outlineVariant),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingS,
          vertical: 4,
        ),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: cs.surface,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: cs.onSurface),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: cs.onSurfaceVariant,
        ),
        elevation: 3,
      ),

      // ── Snackbar ──────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: cs.inverseSurface,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: cs.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  /// Builds a full [TextTheme] by pairing [AppTextStyles] metrics (font,
  /// size, height) with colors derived from [cs], so every role adapts
  /// automatically when the theme changes.
  static TextTheme _buildTextTheme(ColorScheme cs) {
    final primary = cs.onSurface;
    final secondary = cs.onSurfaceVariant;

    return TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: primary),
      displayMedium: AppTextStyles.headlineLarge.copyWith(color: primary),
      displaySmall: AppTextStyles.headlineMedium.copyWith(color: primary),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: primary),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: primary),
      headlineSmall: AppTextStyles.titleLarge.copyWith(color: primary),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: primary),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: primary),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: primary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: primary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: primary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: secondary),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: primary),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: primary),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: secondary),
    );
  }

  /// Returns [active] when the widget is selected; null (default) otherwise.
  static Color? _resolveActive(Set<WidgetState> states, Color active) {
    if (states.contains(WidgetState.disabled)) return null;
    if (states.contains(WidgetState.selected)) return active;
    return null;
  }
}

import 'package:flutter/material.dart';

/// Application color palette.
///
/// Organised in two layers:
///   1. **Primitives** — raw hex values, named after their visual appearance.
///   2. **Semantic tokens** — role-based constants consumed by the theme.
///
/// Rules:
///   - Widgets should reference semantic tokens, never primitives directly.
///   - Primitives live here solely to back the semantic tokens.
///   - Color decisions for a given theme belong in AppTheme, not here.
class AppColors {
  AppColors._();

  // ── Primitives ────────────────────────────────────────────────────────────

  static const Color _teal800 = Color(0xFF008A8E);
  static const Color _teal600 = Color(0xFF00B4B9);

  static const Color _navy700_05 = Color(0x0C06436F); // 5 % opacity
  static const Color _navy700_50 = Color(0x8006436F); // 50 % opacity

  static const Color _slate500 = Color(0xFF7892A5);
  static const Color _slate400 = Color(0xFF9DAFBE);
  static const Color _slate200 = Color(0xFFE6ECF0);
  static const Color _slate100 = Color(0xFFF8FBFC);

  static const Color _ink900 = Color(0xFF2E2E2E);

  static const Color _red500 = Color(0xFFF02C43);
  static const Color _green500 = Color(0xFF46BD30);
  static const Color _yellow400 = Color(0xFFFFDA11);
  static const Color _lightBlue400 = Color(0xFF7CC0DD);

  // Dark surfaces
  static const Color _dark900 = Color(0xFF0D0D0D);
  static const Color _dark800 = Color(0xFF161616);
  static const Color _dark700 = Color(0xFF1F1F1F);
  static const Color _dark600 = Color(0xFF2A2A2A);
  static const Color _dark500 = Color(0xFF3A3A3A);

  static const Color _white = Color(0xFFFFFFFF);
  static const Color _whiteTransparent = Color(0x00FFFFFF);

  // ── Semantic tokens — Brand ───────────────────────────────────────────────

  static const Color primary = _teal800;
  static const Color primaryVariant = _teal600;

  // ── Semantic tokens — Light surface ───────────────────────────────────────

  static const Color lightBackground = _white;
  static const Color lightSurface = _white;
  static const Color lightSurfaceVariant = _slate100;
  static const Color lightOnSurface = _ink900;
  static const Color lightOnSurfaceSecondary = _slate500;
  static const Color lightInputFill = _slate100;
  static const Color lightDivider = _slate200;

  // ── Semantic tokens — Dark surface ────────────────────────────────────────

  static const Color darkBackground = _dark900;
  static const Color darkSurface = _dark800;
  static const Color darkSurfaceVariant = _dark700;
  static const Color darkOnSurface = Color(0xFFE8E8E8);
  static const Color darkOnSurfaceSecondary = _slate400;
  static const Color darkInputFill = _dark600;
  static const Color darkDivider = _dark500;

  // ── Semantic tokens — Feedback ────────────────────────────────────────────

  static const Color error = _red500;
  static const Color success = _green500;
  static const Color warning = _yellow400;
  static const Color info = _lightBlue400;

  // ── Semantic tokens — Neutral ─────────────────────────────────────────────

  static const Color shadow = _navy700_05;
  static const Color shadowStrong = _navy700_50;
  static const Color border = _slate400;

  // ── MaterialColor (required for M2 primarySwatch) ─────────────────────────

  static MaterialColor get primarySwatch => MaterialColor(
        primary.toARGB32(),
        {
          50: primary.withValues(alpha: 0.05),
          100: primary.withValues(alpha: 0.1),
          200: primary.withValues(alpha: 0.2),
          300: primary.withValues(alpha: 0.3),
          400: primary.withValues(alpha: 0.4),
          500: primary.withValues(alpha: 0.5),
          600: primary.withValues(alpha: 0.6),
          700: primary.withValues(alpha: 0.7),
          800: primary.withValues(alpha: 0.8),
          900: primary,
        },
      );

  // ── Gradient helpers ──────────────────────────────────────────────────────

  /// Fully transparent version of [lightSurface], used as gradient start.
  static const Color lightSurfaceTransparent = _whiteTransparent;

  /// Fully transparent version of [darkSurface], used as gradient start.
  static const Color darkSurfaceTransparent = Color(0x00161616);
}

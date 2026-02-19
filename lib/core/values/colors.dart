import 'package:flutter/material.dart';

/// Single source of truth for every color used in the app.
///
/// Structure:
///   Base        — pure black, white, transparent
///   Light theme — all roles for the light ColorScheme
///   Dark theme  — all roles for the dark ColorScheme
///   Feedback    — error / success / warning / info (theme-agnostic)
///   Shadows     — semi-transparent blacks
///   Gradients   — transparent helpers for fade effects
class AppColors {
  AppColors._();

  // ── Base ──────────────────────────────────────────────────────────────────

  static const Color black       = Color(0xFF000000);
  static const Color white       = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  // ── Light theme ───────────────────────────────────────────────────────────

  static const Color lightPrimary              = black;
  static const Color lightOnPrimary            = white;
  static const Color lightPrimaryContainer     = Color(0xFFF0F0F0);
  static const Color lightOnPrimaryContainer   = black;
  static const Color lightSecondary            = Color(0xFF555555);
  static const Color lightOnSecondary          = white;
  static const Color lightSecondaryContainer   = Color(0xFFF5F5F5);
  static const Color lightOnSecondaryContainer = black;
  static const Color lightSurface              = white;
  static const Color lightOnSurface            = black;
  static const Color lightSurfaceVariant       = Color(0xFFF0F0F0);
  static const Color lightOnSurfaceVariant     = Color(0xFF555555);
  static const Color lightOutline              = Color(0xFF999999);
  static const Color lightOutlineVariant       = Color(0xFFE0E0E0);
  static const Color lightErrorContainer       = Color(0xFFFFDAD6);
  static const Color lightOnErrorContainer     = Color(0xFF410002);
  static const Color lightInverseSurface       = black;
  static const Color lightOnInverseSurface     = white;
  static const Color lightInversePrimary       = white;

  // ── Dark theme ────────────────────────────────────────────────────────────

  static const Color darkPrimary              = white;
  static const Color darkOnPrimary            = black;
  static const Color darkPrimaryContainer     = Color(0xFF1A1A1A);
  static const Color darkOnPrimaryContainer   = white;
  static const Color darkSecondary            = Color(0xFFAAAAAA);
  static const Color darkOnSecondary          = black;
  static const Color darkSecondaryContainer   = Color(0xFF1F1F1F);
  static const Color darkOnSecondaryContainer = white;
  static const Color darkSurface              = black;
  static const Color darkOnSurface            = white;
  static const Color darkSurfaceVariant       = Color(0xFF1A1A1A);
  static const Color darkOnSurfaceVariant     = Color(0xFFAAAAAA);
  static const Color darkOutline              = Color(0xFF666666);
  static const Color darkOutlineVariant       = Color(0xFF2A2A2A);
  static const Color darkErrorContainer       = Color(0xFF93000A);
  static const Color darkOnErrorContainer     = Color(0xFFFFDAD6);
  static const Color darkInverseSurface       = white;
  static const Color darkOnInverseSurface     = black;
  static const Color darkInversePrimary       = black;

  // ── Feedback (same in both themes) ────────────────────────────────────────

  static const Color error   = Color(0xFFF02C43);
  static const Color success = Color(0xFF46BD30);
  static const Color warning = Color(0xFFFFDA11);
  static const Color info    = Color(0xFF7CC0DD);

  // ── Shadows ───────────────────────────────────────────────────────────────

  static const Color shadow       = Color(0x14000000); // black  8 %
  static const Color shadowStrong = Color(0x33000000); // black 20 %

  // ── Gradient helpers ──────────────────────────────────────────────────────

  static const Color lightSurfaceTransparent = Color(0x00FFFFFF);
  static const Color darkSurfaceTransparent  = Color(0x00000000);
}

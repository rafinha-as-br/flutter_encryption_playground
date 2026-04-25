import 'package:flutter/material.dart';

/// Midnight Terminal Design System — Color Tokens
///
/// Dark palette from Stitch "Midnight Terminal" design system.
/// Light palette is a coherent inverse derivation.
class AppColors {
  // ──────────────────────────────────────────────
  // DARK THEME — "The Obsidian Console"
  // ──────────────────────────────────────────────

  // Surface hierarchy (stacked monolithic plates)
  static const Color darkSurface = Color(0xFF080F11); // The void
  static const Color darkSurfaceDim = Color(0xFF080F11);
  static const Color darkSurfaceContainerLowest = Color(0xFF000000);
  static const Color darkSurfaceContainerLow = Color(0xFF0F141A);
  static const Color darkSurfaceContainer = Color(0xFF151A21); // Primary content regions
  static const Color darkSurfaceContainerHigh = Color(0xFF1B2028); // Focused interaction zones
  static const Color darkSurfaceContainerHighest = Color(0xFF20262F);
  static const Color darkSurfaceBright = Color(0xFF262C36); // Hover states
  static const Color darkSurfaceVariant = Color(0xFF20262F);

  // Primary — Neon Cyan
  static const Color darkPrimary = Color(0xFFA1FAFF);
  static const Color darkPrimaryDim = Color(0xFF00E5EE);
  static const Color darkPrimaryContainer = Color(0xFF00F4FE);
  static const Color darkOnPrimary = Color(0xFF006165);
  static const Color darkOnPrimaryContainer = Color(0xFF00575B);

  // Secondary — Neon Emerald
  static const Color darkSecondary = Color(0xFF55FE7E);
  static const Color darkSecondaryDim = Color(0xFF42EF72);
  static const Color darkSecondaryContainer = Color(0xFF006E2B);
  static const Color darkOnSecondary = Color(0xFF005D23);
  static const Color darkOnSecondaryContainer = Color(0xFFE4FFE1);

  // Tertiary — Lavender
  static const Color darkTertiary = Color(0xFFCCA8FF);
  static const Color darkTertiaryDim = Color(0xFFB48AEF);
  static const Color darkTertiaryContainer = Color(0xFFC197FE);
  static const Color darkOnTertiary = Color(0xFF481D7E);
  static const Color darkOnTertiaryContainer = Color(0xFF3D0E74);

  // Text / On-Surface
  static const Color darkOnSurface = Color(0xFFF1F3FC);
  static const Color darkOnSurfaceVariant = Color(0xFFA8ABB3);
  static const Color darkOnBackground = Color(0xFFF1F3FC);

  // Error
  static const Color darkError = Color(0xFFFF716C);
  static const Color darkErrorDim = Color(0xFFD7383B);
  static const Color darkErrorContainer = Color(0xFF9F0519);
  static const Color darkOnError = Color(0xFF490006);
  static const Color darkOnErrorContainer = Color(0xFFFFA8A3);

  // Outline / Borders
  static const Color darkOutline = Color(0xFF72757D);
  static const Color darkOutlineVariant = Color(0xFF44484F);

  // Inverse
  static const Color darkInverseSurface = Color(0xFFF8F9FF);
  static const Color darkInverseOnSurface = Color(0xFF51555C);
  static const Color darkInversePrimary = Color(0xFF006A6E);

  // Surface tint
  static const Color darkSurfaceTint = Color(0xFFA1FAFF);

  // ──────────────────────────────────────────────
  // LIGHT THEME — Derived inverse
  // ──────────────────────────────────────────────

  // Surface hierarchy
  static const Color lightSurface = Color(0xFFF8F9FF);
  static const Color lightSurfaceDim = Color(0xFFE8EAF0);
  static const Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color lightSurfaceContainerLow = Color(0xFFF2F3F9);
  static const Color lightSurfaceContainer = Color(0xFFECEDF3);
  static const Color lightSurfaceContainerHigh = Color(0xFFE6E8EE);
  static const Color lightSurfaceContainerHighest = Color(0xFFE0E2E8);
  static const Color lightSurfaceBright = Color(0xFFF8F9FF);
  static const Color lightSurfaceVariant = Color(0xFFDFE2EA);

  // Primary — Toned Cyan for light
  static const Color lightPrimary = Color(0xFF006A6E);
  static const Color lightPrimaryContainer = Color(0xFF6FF7FD);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnPrimaryContainer = Color(0xFF002021);

  // Secondary — Toned Emerald for light
  static const Color lightSecondary = Color(0xFF006E2B);
  static const Color lightSecondaryContainer = Color(0xFF7DFC99);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightOnSecondaryContainer = Color(0xFF002108);

  // Tertiary — Toned Lavender for light
  static const Color lightTertiary = Color(0xFF6339A0);
  static const Color lightTertiaryContainer = Color(0xFFE9DDFF);
  static const Color lightOnTertiary = Color(0xFFFFFFFF);
  static const Color lightOnTertiaryContainer = Color(0xFF1F0050);

  // Text / On-Surface
  static const Color lightOnSurface = Color(0xFF1A1C22);
  static const Color lightOnSurfaceVariant = Color(0xFF44484F);
  static const Color lightOnBackground = Color(0xFF1A1C22);

  // Error
  static const Color lightError = Color(0xFFBA1A1A);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightOnErrorContainer = Color(0xFF410002);

  // Outline / Borders
  static const Color lightOutline = Color(0xFF757780);
  static const Color lightOutlineVariant = Color(0xFFC4C6D0);

  // Inverse
  static const Color lightInverseSurface = Color(0xFF2F3038);
  static const Color lightInverseOnSurface = Color(0xFFF1F0F7);
  static const Color lightInversePrimary = Color(0xFF4DDBE2);

  // Surface tint
  static const Color lightSurfaceTint = Color(0xFF006A6E);

  // ──────────────────────────────────────────────
  // AMBIENT GLOW EFFECTS (utility, not theme slots)
  // ──────────────────────────────────────────────

  /// Cyan glow for primary elements: 0px 0px 15px rgba(0, 245, 255, 0.12)
  static const Color cyanGlow = Color(0x1F00F5FF);

  /// Emerald glow for success/secondary elements: 0px 0px 15px rgba(80, 250, 123, 0.12)
  static const Color emeraldGlow = Color(0x1F50FA7B);

  // ──────────────────────────────────────────────
  // SIDE MENU TOKENS
  // ──────────────────────────────────────────────
  static const Color sideMenuBackground = Color(0xFF080F11);
  static const Color sideMenuTextInactive = Color(0xFF94A3B8);
  static const Color sideMenuTextActive = Color(0xFF00E5FF);
  static const Color sideMenuHoverBackground = Color(0x0DFFFFFF); // rgba(255,255,255,0.05)
  static const Color sideMenuActiveBackground = Color(0x1A00E5FF); // rgba(0,229,255,0.1)
}

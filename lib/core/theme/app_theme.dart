import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final base = ThemeData.light(useMaterial3: true);
    final textTheme = GoogleFonts.interTextTheme(
      base.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.xColor,
        tertiary: AppColors.oColor,
        surface: AppColors.surface,
        error: AppColors.danger,
      ),
      textTheme: textTheme.copyWith(
        headlineLarge: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
        headlineMedium: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
        titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        titleMedium: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        bodyMedium: textTheme.bodyMedium?.copyWith(height: 1.4),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.surface.withValues(alpha: .96),
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          letterSpacing: .2,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: AppColors.ghostBorder),
        ),
      ),
      dividerColor: AppColors.divider,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceHigh,
        hintStyle: GoogleFonts.inter(
          color: AppColors.textMuted,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w700,
          fontSize: 12,
          letterSpacing: .4,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.ghostBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.ghostBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.ghostBorder),
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

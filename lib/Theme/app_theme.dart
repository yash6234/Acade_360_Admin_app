import 'package:flutter/material.dart';

class AppTheme {
  static const primaryWhite = Color(0xFFFFFFFF);
  static const primaryBlack = Color(0xFF000000);
  static const accentRed = Color(0xFFFF3B30);
  static const secondaryBlue = Color(0xFF007AFF);
  static const secondaryGray = Color(0x996E6E73);
  static const backgroundLight = Color(0xFFF2F2F7);
  static const backgroundDark = Color(0xFF1C1C1E);
  static const surfaceDark = Color(0xFF2C2C2E);

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: accentRed,
      brightness: Brightness.light,
      primary: accentRed,
      secondary: secondaryBlue,
      surface: primaryWhite,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: colorScheme,
      fontFamily: 'Roboto',
      textTheme: _textTheme(primaryBlack),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: primaryWhite.withValues(alpha: 0.84),
        borderColor: primaryBlack.withValues(alpha: 0.08),
        focusedBorderColor: accentRed,
        labelColor: secondaryGray,
      ),
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: accentRed,
      brightness: Brightness.dark,
      primary: accentRed,
      secondary: secondaryBlue,
      surface: surfaceDark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: colorScheme,
      fontFamily: 'Roboto',
      textTheme: _textTheme(primaryWhite),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: primaryWhite.withValues(alpha: 0.08),
        borderColor: primaryWhite.withValues(alpha: 0.10),
        focusedBorderColor: accentRed,
        labelColor: primaryWhite.withValues(alpha: 0.64),
      ),
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      headlineLarge: TextStyle(
        color: color,
        fontSize: 34,
        fontWeight: FontWeight.w800,
        height: 1.05,
      ),
      headlineMedium: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      ),
      titleLarge: TextStyle(
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: color.withValues(alpha: 0.78),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: color.withValues(alpha: 0.68),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
    required Color focusedBorderColor,
    required Color labelColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      labelStyle: TextStyle(color: labelColor, fontWeight: FontWeight.w500),
      prefixIconColor: labelColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
      ),
    );
  }

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentRed,
          foregroundColor: primaryWhite,
          disabledBackgroundColor: accentRed.withValues(alpha: 0.42),
          disabledForegroundColor: primaryWhite.withValues(alpha: 0.72),
          elevation: 0,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );
  static const Color videoAccent = Color(0xFFFF3B30);
  static const Color successGreen = Color(0xFF34C759);
  static const Color warningGold = Color(0xFFFFCC00);
  // static const Color successGreen = Color(0xFF34C759);
  // static const Color warningGold = Color(0xFFFFCC00);
  // static const Color videoAccent = accentRed;

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color pageBackground(BuildContext context) {
    return isDark(context) ? backgroundDark : backgroundLight;
  }

  static Color cardBackground(BuildContext context) {
    return isDark(context)
        ? primaryWhite.withOpacity(0.06)
        : primaryWhite.withOpacity(0.90);
  }

  static Color border(BuildContext context) {
    return isDark(context)
        ? primaryWhite.withOpacity(0.08)
        : primaryBlack.withOpacity(0.08);
  }

  static Color textPrimary(BuildContext context) {
    return isDark(context) ? primaryWhite : primaryBlack;
  }

  static Color textSecondary(BuildContext context) {
    return isDark(context)
        ? primaryWhite.withOpacity(0.60)
        : primaryBlack.withOpacity(0.60);
  }

  static Color softFill(BuildContext context, {double alpha = 0.10}) {
    return isDark(context)
        ? primaryWhite.withOpacity(alpha)
        : primaryBlack.withOpacity(alpha);
  }
}

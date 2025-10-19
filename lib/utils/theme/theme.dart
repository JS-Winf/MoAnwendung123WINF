import 'package:flutter/material.dart';
import 'package:hotshop/utils/constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  /// LIGHT
  static ThemeData get lightTheme {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: TColors.primary,
        brightness: Brightness.light,
        primary: TColors.primary,
        onPrimary: TColors.white,
        surface: TColors.white,
        onSurface: TColors.black,
        background: TColors.backgroundLight,
        onBackground: TColors.black,
        error: TColors.error,
      ),
      scaffoldBackgroundColor: TColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: TColors.black,
      ),
      iconTheme: const IconThemeData(color: TColors.grey800),
      textTheme: _textTheme(Brightness.light),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          foregroundColor: TColors.white,
          minimumSize: const Size.fromHeight(44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: TColors.grey100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.primary),
        ),
        labelStyle: const TextStyle(color: TColors.grey600),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }

  /// DARK
  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: TColors.primaryDark,
        brightness: Brightness.dark,
        primary: TColors.primaryDark,
        onPrimary: TColors.white,
        surface: const Color(0xFF161C26),
        onSurface: TColors.grey200,
        background: TColors.backgroundDark,
        onBackground: TColors.grey200,
        error: TColors.error,
      ),
      scaffoldBackgroundColor: TColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: TColors.grey200,
      ),
      iconTheme: const IconThemeData(color: TColors.grey200),
      textTheme: _textTheme(Brightness.dark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primaryDark,
          foregroundColor: TColors.white,
          minimumSize: const Size.fromHeight(44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF111722),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF243042)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.primaryDark),
        ),
        labelStyle: const TextStyle(color: TColors.grey600),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }

  static TextTheme _textTheme(Brightness b) {
    final isDark = b == Brightness.dark;
    final base = isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme;
    return base.copyWith(
      headlineSmall: base.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      bodyMedium : base.bodyMedium?.copyWith(
        color: isDark ? TColors.grey200 : TColors.grey800,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); 
  // Privater Konstruktor: Klasse dient nur als Container für statische Themes

  // ---------------------- LIGHT THEME OUTLINED BUTTON ----------------------
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0, // OutlinedButtons sind flach (kein Schatten)
      foregroundColor: Colors.black, // Text/Icon-Farbe
      side: const BorderSide(color: Color(0xFF764ba2)), // Rahmenfarbe (Brand/Primary)
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600, // etwas kräftiger für bessere Lesbarkeit
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // komfortabler Klickbereich
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14), // weiche, moderne Ecken
      ),
    ),
  );

  // ---------------------- DARK THEME OUTLINED BUTTON ----------------------
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white, // kontrastreiche Text/Icon-Farbe im Dark Mode
      side: const BorderSide(color: Color(0xFF764ba2)), // gleicher Marken-Rahmen
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}

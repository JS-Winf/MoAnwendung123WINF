import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); 
  // Privater Konstruktor → Klasse dient nur als statischer Theme-Container

  // ---------------------- LIGHT THEME ELEVATED BUTTON ----------------------
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, // Keine Schatten für modernes, flaches UI
      foregroundColor: Colors.white, // Text/Icon-Farbe im aktiven Zustand
      backgroundColor: const Color(0xFF764ba2), // Primärfarbe des Buttons
      disabledForegroundColor: Colors.grey, // Textfarbe wenn deaktiviert
      disabledBackgroundColor: Colors.grey, // Hintergrundfarbe wenn deaktiviert
      side: const BorderSide(color: Color(0xFF764ba2)), // Randfarbe (Primary)
      padding: const EdgeInsets.symmetric(vertical: 18), // Höhere Buttons (komfortabler)
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600, // Halb-fett für bessere Lesbarkeit
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Abgerundete Ecken → moderne UI
      ),
    ),
  );

  // ---------------------- DARK THEME ELEVATED BUTTON ----------------------
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0, // Ebenfalls flach im Dark Mode
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF764ba2), // Gleiche Primärfarbe wie im Light Mode
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Color(0xFF764ba2)), // Rand bleibt gleich
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

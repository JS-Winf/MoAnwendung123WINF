import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // Privater Konstruktor: nur statische Nutzung als Theme-Container

  // ---------------------- LIGHT THEME INPUT DECORATION ----------------------
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,                          // Max. Zeilen für Fehlermeldungen
    prefixIconColor: Colors.grey,              // Farbe für Prefix-Icons
    suffixIconColor: Colors.grey,              // Farbe für Suffix-Icons
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight), // (auskommentiertes Beispiel)
    labelStyle: const TextStyle().copyWith(
      fontSize: 14, 
      color: Colors.black,                     // Label-Farbe
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14, 
      color: Colors.black,                     // Hint-/Placeholder-Farbe
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,             // Stil der Fehlermeldung
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.8),    // Farbe des „schwebenden“ Labels
    ),

    // Standardrahmen (wird als Basis kopiert)
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), // Abgerundete Ecken
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),

    // Rahmen, wenn Feld aktiviert (nicht fokussiert)
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),

    // Rahmen, wenn Feld fokussiert ist
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),

    // Rahmen bei Fehler
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),

    // Rahmen bei Fehler + Fokus
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );

  // ---------------------- DARK THEME INPUT DECORATION ----------------------
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: 14, 
      color: Colors.white,                     // Label-Farbe im Dark Mode
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14, 
      color: Colors.white,                     // Hint-Farbe im Dark Mode
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.8),    // „Schwebendes“ Label im Dark Mode
    ),

    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.white), // heller Fokus im Dark Mode
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}

import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._(); // Privater Konstruktor: nur statische Nutzung als Theme-Container

  // ---------------------- LIGHT THEME TEXT ----------------------
  static TextTheme lightTextTheme = TextTheme(
    // Überschriften (H1–H3)
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),

    // Titel (z. B. AppBar-/Section-Titel)
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),

    // Fließtext
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),

    // Labels (kleinere Texte, Beschriftungen, Badges)
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
  );

  // ---------------------- DARK THEME TEXT ----------------------
  static TextTheme darkTextTheme = TextTheme(
    // Überschriften (H1–H3) in Weiß
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),

    // Titel in Weiß
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),

    // Fließtext in Weiß
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),

    // Labels in Weiß (leicht abgetönt für Medium)
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
  );
}

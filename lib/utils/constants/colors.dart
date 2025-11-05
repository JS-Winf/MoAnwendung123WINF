import 'package:flutter/material.dart';

class TColors {
  TColors._(); // Private Konstruktor: Verhindert Instanziierung (nur statische Nutzung)

  // App Basic Colors
  static const Color primary = Color(0xFF4B68FF);   // Primärfarbe (Brand)
  static const Color secondary = Color(0xFFFFE24B); // Sekundärfarbe/Akzent
  static const Color accent = Color(0xFFb0c7ff);    // Heller Akzentton

  // Text colors
  static const Color textPrimary = Color(0xFF333333); // Haupttext
  static const Color textSecondary = Color(0xFF6C757D); // Sekundärtext/Untertitel
  static const Color textWhite = Colors.white;         // Weißer Text

  // Background colors
  static const Color light = Color(0xFFF6F6F6);        // Heller Hintergrund
  static const Color dark = Color(0xFF272727);         // Dunkler Hintergrund
  static const Color primaryBackground = Color(0xFFF3F5FF); // Tinted Hintergrund

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6); // Helle Card/Container-Fläche
  static Color darkContainer = TColors.white.withOpacity(0.1); // Transparenter Weißton für Dark Mode Overlays

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68FF); // Primär-Button
  static const Color buttonSecondary = Color(0xFF6C757D); // Sekundär-Button/Neutral
  static const Color buttonDisabled = Color(0xFFC4C4C4); // Deaktivierte Buttons

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);  // Haupt-Grenzlinien
  static const Color borderSecondary = Color(0xFFE6E6E6); // Leichte Divider/Trennlinien

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);   // Fehler/Fehlermeldungen
  static const Color success = Color(0xFF388E3C); // Erfolg/Bestätigung
  static const Color warning = Color(0xFFF57C00); // Warnungen/Hinweise
  static const Color info = Color(0xFF1976D2);    // Informationshinweise

  // Neutral Shades
  static const Color black = Color(0xFF232323);      // Tiefschwarz für Text/Icons
  static const Color darkerGrey = Color(0xFF4F4F4F); // Dunkles Grau (Sekundärtext im Dark Mode)
  static const Color darkGrey = Color(0xFF939393);   // Neutrales Grau
  static const Color grey = Color(0xFFE0E0E0);       // Hellgrau (Borders/Divider)
  static const Color softGrey = Color(0xFFF4F4F4);   // Sehr helles Grau (Flächen)
  static const Color lightGrey = Color(0xFFF9F9F9);  // Fast weiß (Hintergründe)
  static const Color white = Color(0xFFFFFFFF);      // Weiß
}

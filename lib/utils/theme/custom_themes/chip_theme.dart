import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._(); // Privater Konstruktor, damit keine Instanz erstellt werden kann (Utility-Klasse)

  // ---------------------- LIGHT THEME CHIP ----------------------
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4), 
    // Farbe, wenn der Chip deaktiviert ist

    labelStyle: const TextStyle(color: Colors.black), 
    // Textfarbe des Chip-Labels im Light Mode

    selectedColor: const Color(0xFF764ba2), 
    // Hintergrundfarbe für ausgewählte Chips (Primary-/Brand-Color)

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), 
    // Innenabstand – macht den Chip größer/luftiger

    checkmarkColor: Colors.white, 
    // Farbe des Häkchens wenn Chip auswählbar/aktiviert ist
  );

  // ---------------------- DARK THEME CHIP ----------------------
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey, 
    // dunkleres Grau für deaktivierte Chips im Dark Mode

    labelStyle: TextStyle(color: Colors.white), 
    // Textfarbe im Dark Mode (weiß für Kontrast)

    selectedColor: Color(0xFF764ba2), 
    // gleiche Branding-Farbe wie im Light Mode

    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12), 
    // gleicher Abstand wie im Light Mode

    checkmarkColor: Colors.white, 
    // Häkchen bleibt weiß (gut sichtbar auf Primärfarbe)
  );
}

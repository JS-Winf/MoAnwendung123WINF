import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._(); // Privater Konstruktor: nur statische Nutzung als Theme-Container

  // ---------------------- LIGHT THEME CHECKBOX ----------------------
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    // Eckenradius der Checkbox (leicht abgerundet)
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    // Farbe des Häkchens (Vordergrund)
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // ausgewählt: weißes Häkchen
      } else {
        return Colors.black; // nicht ausgewählt: schwarzes Häkchen (sichtbar auf transparentem Hintergrund)
      }
    }),

    // Füllfarbe der Checkbox (Hintergrund)
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF764ba2); // ausgewählt: Marken-/Akzentfarbe
      } else {
        return Colors.transparent; // nicht ausgewählt: transparent (nur Umriss)
      }
    }),
  );

  // ---------------------- DARK THEME CHECKBOX ----------------------
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    // gleiche Form wie im Light Theme
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    // Farbe des Häkchens
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // weißes Häkchen auf dunkler/akzentfarbener Fläche
      } else {
        return Colors.black; // unselektiert (transparent), Häkchen wäre schwarz
      }
    }),

    // Füllfarbe der Checkbox
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF764ba2); // gleiche Akzentfarbe wie im Light Theme
      } else {
        return Colors.transparent; // unselektiert bleibt transparent
      }
    }),
  );
}

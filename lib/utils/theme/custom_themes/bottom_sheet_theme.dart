import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._(); // Privater Konstruktor: Nur statische Nutzung als Theme-Container

  // ---------------------- LIGHT THEME BOTTOM SHEET ----------------------
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,                 // Zeigt den kleinen „Griff“ oben am BottomSheet
    backgroundColor: Colors.white,        // Hintergrundfarbe für persistente BottomSheets
    modalBackgroundColor: Colors.white,   // Hintergrundfarbe für modale BottomSheets (showModalBottomSheet)
    constraints: const BoxConstraints(
      minWidth: double.infinity,          // Mindestens volle Breite einnehmen
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // Abgerundete Ecken
    ),
  );

  // ---------------------- DARK THEME BOTTOM SHEET ----------------------
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,                 // Griff auch im Dark Mode anzeigen
    backgroundColor: Colors.black,        // Dunkler Hintergrund für persistente BottomSheets
    modalBackgroundColor: Colors.black,   // Dunkler Hintergrund für modale BottomSheets
    constraints: const BoxConstraints(
      minWidth: double.infinity,          // Mindestens volle Breite einnehmen
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // Abgerundete Ecken
    ),
  );
}

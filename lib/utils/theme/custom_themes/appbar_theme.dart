import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._(); // Private Constructor -> verhindert Instanziierung (Utility-Klasse)

  // ---------------------- LIGHT THEME APP BAR ----------------------
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0, // Kein Schatten für ein flaches, modernes UI
    centerTitle: false, // Titel links statt zentriert
    scrolledUnderElevation: 0, // Kein Schatten, wenn gescrollt wird
    backgroundColor: Colors.transparent, // Transparenter Hintergrund
    surfaceTintColor: Colors.transparent, // Kein Tint-Effekt im Material 3
    iconTheme: IconThemeData(
      color: Colors.black, // Farbe der Icons
      size: 24, // Icon-Größe
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black, // Farbe der Action-Icons (rechts)
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, // Halbfett für Titel
      color: Colors.black, // Textfarbe Titel
    ),
  );

  // ---------------------- DARK THEME APP BAR ----------------------
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.black, // Achtung: hier schwarz 
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white, // Action-Icons werden weiß angezeigt
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white, // Weißer Titel im Dark-Mode
    ),
  );
}

import 'package:hotshop/utils/constants/colors.dart'; // App-weite Farbkonstanten
import 'package:flutter/material.dart';

import 'custom_themes/text_field_theme.dart';      // InputDecorationTheme (Textfelder)
import 'custom_themes/appbar_theme.dart';          // AppBarTheme (Light/Dark)
import 'custom_themes/bottom_sheet_theme.dart';    // BottomSheetThemeData
import 'custom_themes/checkbox_theme.dart';        // CheckboxThemeData
import 'custom_themes/chip_theme.dart';            // ChipThemeData
import 'custom_themes/elevated_button_theme.dart'; // ElevatedButtonThemeData
import 'custom_themes/outlined_button_theme.dart'; // OutlinedButtonThemeData
import 'custom_themes/text_theme.dart';            // TextTheme (Typografie)

class TAppTheme {
  TAppTheme._(); // Privater Konstruktor: Klasse dient als statischer Theme-Container

  // ---------------------- LIGHT THEME ----------------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,                          // Material 3 aktivieren
    fontFamily: 'Poppins',                       // Globale Schriftart
    brightness: Brightness.light,                // Helles Farbschema
    primaryColor: const Color(0xFF764ba2),       // Primärfarbe der App
    textTheme: TTextTheme.lightTextTheme,        // Typografie (Light)
    chipTheme: TChipTheme.lightChipTheme,        // Chips (Light)
    scaffoldBackgroundColor: TColors.light,      // Hintergrundfarbe Scaffold
    appBarTheme: TAppBarTheme.lightAppBarTheme,  // AppBar (Light)
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme, // Checkboxen (Light)
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme, // BottomSheets (Light)
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme, // ElevatedButtons (Light)
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme, // OutlinedButtons (Light)
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme, // Textfelder (Light)
  );

  // ---------------------- DARK THEME ----------------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,                          // Material 3 aktivieren
    fontFamily: 'Poppins',                       // Globale Schriftart
    brightness: Brightness.dark,                 // Dunkles Farbschema
    primaryColor: const Color(0xFF764ba2),       // Primärfarbe bleibt identisch
    textTheme: TTextTheme.darkTextTheme,         // Typografie (Dark)
    chipTheme: TChipTheme.darkChipTheme,         // Chips (Dark)
    scaffoldBackgroundColor: TColors.dark,       // Hintergrundfarbe Scaffold (Dark)
    appBarTheme: TAppBarTheme.darkAppBarTheme,   // AppBar (Dark)
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme, // Checkboxen (Dark)
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme, // BottomSheets (Dark)
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme, // ElevatedButtons (Dark)
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme, // OutlinedButtons (Dark)
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme, // Textfelder (Dark)
  );
}

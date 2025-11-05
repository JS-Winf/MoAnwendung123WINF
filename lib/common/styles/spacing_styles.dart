import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

/// Definiert standardisierte Abstände für Layout-Elemente in der App.
class TSpacingStyle {
  /// Standard-Padding, das den Platz für die AppBar berücksichtigt.
  /// Wird verwendet, um Inhalte unterhalb der AppBar korrekt zu positionieren
  /// und ein einheitliches Layout zu sichern.
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,        // Abstand nach oben = Höhe der AppBar
    left: TSizes.defaultSpace,       // Standard-Rand links
    bottom: TSizes.defaultSpace,     // Standard-Rand unten
    right: TSizes.defaultSpace,      // Standard-Rand rechts
  );
}

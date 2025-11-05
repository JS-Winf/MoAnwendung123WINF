import 'package:flutter/cupertino.dart';

import '../../utils/constants/colors.dart';

/// Definiert Schattenstile für UI-Elemente (z. B. Produkt-Karten).
class TShadowStyle {
  /// Vertikaler Produktschatten
  /// - Leichter dunkler Grauton mit Transparenz
  /// - Weicher Blur (50)
  /// - Breite Ausbreitung (7)
  /// - Leichter Versatz nach unten (0, 2)
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  /// Horizontaler Produktschatten
  /// (aktuell identisch mit dem vertikalen Schatten — mögliches Reuse-Pattern)
  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}

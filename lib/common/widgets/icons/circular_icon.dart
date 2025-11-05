import 'package:hotshop/utils/constants/sizes.dart';
import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

/// Kreisförmiges Icon-Widget mit optionalem Hintergrund und OnPressed-Event.
/// Wird häufig für Favoriten-Buttons, Warenkorb-Icons, etc. genutzt.
class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,            // Standard-Icongröße
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;   // Kreisgröße + Icongröße
  final IconData icon;                 // Das Icon-Symbol
  final Color? color;                  // Icon-Farbe
  final Color? backgroundColor;        // Hintergrundfarbe (optional)
  final VoidCallback? onPressed;       // Tap/Hover/Click Callback

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,                     // Kreisbreite
      height: height,                   // Kreishöhe
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100), // Macht den Container kreisförmig
        color: backgroundColor != null
            ? backgroundColor!                         // Falls gesetzt: benutzerdefinierter Hintergrund
            : THelperFunctions.isDarkMode(context)     // Sonst: Theme-basierter Hintergrund
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,                          // Klickfunktion
        icon: Icon(
          icon,
          color: color,                                // Icon-Farbe
          size: size,                                  // Icon-Größe
        ),
      ),
    );
  }
}

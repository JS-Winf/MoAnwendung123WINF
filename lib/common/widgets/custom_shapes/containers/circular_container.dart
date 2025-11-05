import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

/// Runder/kreisförmiger Container mit optionalem Inhalt.
/// Eignet sich für runde Badges, Avatare, dekorative Kreise etc.
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,                 // Standardbreite
    this.height = 400,                // Standardhöhe
    this.radius = 400,                // Großer Radius → Kreis/Rundung
    this.margin,
    this.padding = 0,                 // Innenabstand
    this.backgroundColor = TColors.white, // Standard: weißer Hintergrund
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,                        // Breite des Containers
      height: height,                      // Höhe des Containers
      margin: margin,                      // Außenabstand
      padding: EdgeInsets.all(padding),    // Innenabstand (gleichmäßig)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius), // Rundung/Kreisform
        color: backgroundColor,            // Hintergrundfarbe
      ),
      child: child,                        // Optionaler Inhalt
    );
  }
}

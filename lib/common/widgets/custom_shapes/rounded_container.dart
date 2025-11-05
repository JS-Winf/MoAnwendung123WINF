import 'package:hotshop/utils/constants/colors.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

/// Abgerundeter, wiederverwendbarer Container.
/// Unterstützt optionale Größe, Außen-/Innenabstände, Hintergrundfarbe und (optionalen) Rand.
class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,                          // Standard: kein Rahmen
    this.radius = TSizes.cardRadiusLg,                // Standard-Radius aus den App-Sizes
    this.backgroundColor = TColors.white,             // Standard-Hintergrund: Weiß
    this.borderColor = TColors.borderPrimary,         // Standard-Randfarbe
  });

  final double? width;                                // Breite (optional)
  final double? height;                               // Höhe (optional)
  final double radius;                                // Eckenradius
  final Widget? child;                                // Inhalt
  final bool showBorder;                              // Rahmen ein-/ausschalten
  final Color borderColor;                            // Farbe des Rahmens
  final Color backgroundColor;                        // Hintergrundfarbe
  final EdgeInsetsGeometry? padding;                  // Innenabstand
  final EdgeInsetsGeometry? margin;                   // Außenabstand

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),  // Abgerundete Ecken
        border: showBorder ? Border.all(color: borderColor) : null, // Optionaler Rahmen
      ),
      child: child,
    );
  }
}

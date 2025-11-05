import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

/// Kreisförmiges Bild-Widget mit optionalem Overlay-Farbton und Hintergrund.
/// Unterstützt lokale Assets und Netzwerkbilder.
class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,                 // Standardbreite des Kreises
    this.height = 56,                // Standardhöhe des Kreises
    this.overlayColor,               // Optionaler Farbüberzug (z. B. für Tönungen)
    this.backgroundColor,            // Optionaler Hintergrund (überschreibt Theme-abhängige Farbe)
    required this.image,             // Bildpfad bzw. URL
    this.fit = BoxFit.cover,         // Skalierung des Bildes innerhalb des Kreises
    this.padding = TSizes.sm,        // Innenabstand um das Bild herum
    this.isNetworkImage = false,     // true = NetworkImage, false = AssetImage
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,                             // Kreisbreite
      height: height,                           // Kreishöhe
      padding: EdgeInsets.all(padding),         // Innenabstand
      decoration: BoxDecoration(
        // Hintergrund: entweder explizit gesetzt oder abhängig vom Theme (hell/dunkel)
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100), // 100 → runde Form
      ),
      child: Center(
        child: Image(
          fit: fit,                              // Bild-Skalierung im verfügbaren Raum
          // Quelle: Netzwerk oder Asset, je nach Flag
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
          color: overlayColor,                   // Optionaler Overlay-Farbton
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

/// Abgerundetes Bild-Widget mit optionalem Rahmen, Hintergrund, Padding
/// und Tap-Callback. Unterstützt Asset- und Netzwerkbilder.
class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.border,                         // Optionaler Rahmen ums Bild
    this.padding,                        // Innenabstand des äußeren Containers
    this.onPressed,                      // Tap-Handler (GestureDetector)
    this.width,                          // Breite des Containers
    this.height,                         // Höhe des Containers
    this.applyImageRadius = true,        // Rundung auch auf das Bild selbst anwenden
    required this.imageUrl,              // Quelle: Asset-Pfad oder URL
    this.fit = BoxFit.contain,           // Bild-Skalierung
    this.backgroundColor,                // Hintergrundfarbe hinter dem Bild
    this.isNetworkImage = false,         // true: NetworkImage, false: AssetImage
    this.borderRadius = TSizes.md,       // Eckenradius des Containers/Bilds
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Gesamtes Widget ist klickbar.
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,                                // Optionaler Rahmen
          color: backgroundColor,                        // Optionaler Hintergrund
          borderRadius: BorderRadius.circular(borderRadius), // Abgerundete Ecken
        ),
        // Clippt den Bildinhalt optional ebenfalls auf die gleiche Rundung,
        // damit das Bild die abgerundeten Ecken respektiert.
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)                 // Bild aus dem Netz
                : AssetImage(imageUrl) as ImageProvider, // Bild aus Assets
          ),
        ),
      ),
    );
  }
}

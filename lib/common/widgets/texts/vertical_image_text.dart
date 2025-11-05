import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

/// Vertikale Icon-Text-Kachel (z. B. für Kategorien).
/// Oben: runder Container mit Bild-Asset, unten: kurzer Titel.
/// Reagiert auf Dark/Light-Mode und ist optional klickbar.
class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,                 // Asset-Pfad des Icons/Bildes
    required this.title,                 // Titeltext unter dem Bild
    this.textColor = TColors.white,      // Textfarbe des Titels
    this.backgroundColor,                // Hintergrund des runden Bildcontainers
    this.onTap,                          // Tap-Callback für die gesamte Kachel
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Theme-basiert (Dark/Light) für dynamische Farbwahl.
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap, // Gesamte Kachel ist tappbar.
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Runder Icon-Hintergrund mit Innenabstand
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100), // Kreisform
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),     // Lokales Asset-Bild
                  fit: BoxFit.cover,
                  // Farb-Overlay für bessere Sichtbarkeit je nach Theme
                  color: dark ? TColors.light : TColors.dark,
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Titel unter dem Icon (einzeilig mit Ellipsis)
            SizedBox(
              width: 55, // Begrenzt die Breite, damit Zeilenumbruch kontrolliert ist
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // „…“ bei zu langem Text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/rounded_container.dart';
import 'brand_card.dart';

/// Showcase-Komponente für eine Marke:
/// - Oben: Markenkarte (Name, Verified, Produktanzahl)
/// - Unten: Top-3-Produktbilder der Marke
class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  /// Liste der Asset-Pfade für die Produktbilder (typisch 3 Stück).
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,                             // Rahmen um das ganze Showcase
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),     // Innenabstand
      margin: const EdgeInsets.only(                // Außenabstand nach unten
        bottom: TSizes.spaceBtwItems,
      ),
      child: Column(
        children: [
          /* Brand mit Produktanzahl */
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),

          /* Top 3 Produktbilder der Marke */
          Row(
            // Jedes Bild wird in ein eigenes Expanded-Widget verpackt
            // (siehe Hilfsfunktion) und in eine Zeile gesetzt.
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  /// Einzelnes Produktbild-Element im Showcase.
  /// Nutzt ein TRoundedContainer mit Theme-abhängigem Hintergrund.
  Widget brandTopProductImageWidget(String image, BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,                                // Fixe Höhe für gleichmäßige Kacheln
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        // Bild wird als Asset geladen und proportional skaliert (contain),
        // damit nichts abgeschnitten wird.
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

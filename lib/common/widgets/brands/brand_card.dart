import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

/// Kompakte Brand-Karte mit Icon, Titel (inkl. Verified-Icon) und Produktanzahl.
/// Optional klickbar (onTap) und mit wählbarem Rahmen (showBorder).
class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  /// Ob der umschließende Container einen Rahmen zeigt.
  final bool showBorder;

  /// Optionaler Tap-Handler für die gesamte Karte.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Ermittelt Dark-/Light-Mode für dynamische Farben.
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap, // Gesamte Karte ist klickbar.
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* Icon (Brand-Avatar) */
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,                     // Lokales Asset
                image: TImages.clothIcon,                  // Platzhalter-/Brand-Icon
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black, // Icon-Farbe an Theme angepasst
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /* Text-Bereich */
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titel mit Verified-Icon & großer Schrift
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  // Produktanzahl mit Ellipsis, falls der Text zu lang wird
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

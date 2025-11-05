import 'package:hotshop/common/widgets/texts/brand_title_text.dart';
import 'package:hotshop/utils/constants/colors.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/enums.dart';

/// Widget für Markenname + Verified-Icon.
/// Beispiel: "Nike "
/// Wird oft in Produktkarten oder Markenlisten genutzt.
class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.primary,     // Farbe des Verified-Symbols
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small, // Größe des Marken-Texts
  });

  final String title;                     // Markenname
  final int maxLines;                     // Maximale Textzeilen
  final Color? textColor, iconColor;      // Text- & Iconfarbe
  final TextAlign? textAlign;             // Textausrichtung
  final TextSizes brandTextSize;          // Schriftgrößenenum

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,     // Minimale Breite (passt sich Inhalt an)
      children: [
        // Markenname mit Style
        Flexible(
          child: TBrandTextTitle(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),

        const SizedBox(width: TSizes.xs), // Kleiner Abstand

        // Verified/Icon
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}

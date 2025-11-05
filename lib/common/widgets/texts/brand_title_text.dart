import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

/// Einfaches Text-Widget für Markennamen mit konfigurierbarer Größe.
/// Nutzt eine Enum (`TextSizes`), um unterschiedliche TextStyles aus dem Theme zu wählen.
class TBrandTextTitle extends StatelessWidget {
  const TBrandTextTitle({
    super.key,
    this.color,                         // Optionale Textfarbe
    this.maxLines = 1,                  // Max. Zeilenzahl (Standard: 1)
    required this.title,                // Anzuzeigender Markenname
    this.textAlign = TextAlign.center,  // Textausrichtung
    this.brandTextSize = TextSizes.small, // Gewünschte Textgröße (Enum)
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,   // Schneidet zu langen Text mit "…" ab
      // Wählt je nach brandTextSize den passenden Theme-TextStyle
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}

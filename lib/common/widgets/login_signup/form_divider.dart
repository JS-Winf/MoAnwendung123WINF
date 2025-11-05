import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

/// Trennt Formularbereiche mit einer horizontalen Linie und Text in der Mitte.
/// Beispiel:  --------  oder mit Google fortfahren  --------
class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText, // Text zwischen den Linien (z. B. "or", "oder", "oder mit")
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    // Theme prüfen: dunkler Modus => dunklere Divider-Farbe
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Linke Linie
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 60,      // Abstand vom linken Rand
            endIndent: 5,    // Abstand zwischen Linie und Text
          ),
        ),

        // Text in der Mitte
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),

        // Rechte Linie
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 5,       // Abstand zwischen Text und Linie
            endIndent: 60,   // Abstand vom rechten Rand
          ),
        ),
      ],
    );
  }
}

import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// Einfache Profil-Menüzeile:
/// - Links: Feldtitel
/// - Mitte: aktueller Wert
/// - Rechts: kleines Icon (standardmäßig Pfeil)
/// Die gesamte Zeile ist tappbar (onPressed).
class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.onPressed,                 // Tap-Callback für die gesamte Zeile
    required this.title,                     // Linker Titeltext (Label)
    required this.value,                     // Rechter/zentraler Wert
    this.icon = Iconsax.arrow_right_34,      // Trailing-Icon (Standard: Pfeil)
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Ganze Zeile reagiert auf Tap
      child: Padding(
        // Vertikaler Abstand zwischen den Zeilen
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            // Titelbereich (3/9 der Breite)
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis, // Ellipsis bei langem Text
              ),
            ),

            // Wertbereich (5/9 der Breite)
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Trailing-Icon (1/9 der Breite)
            Expanded(
              child: Icon(icon, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}

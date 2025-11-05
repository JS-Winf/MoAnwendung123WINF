import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

/// Such-/Eingabe-ähnlicher Container (klickbar) mit optionalem Icon.
/// Typisch als „Fake Search Bar“ nutzbar, um z. B. eine Suche-Seite zu öffnen.
class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  /// Platzhalter-/Anzeigetext innerhalb des Containers.
  final String text;

  /// Linkes Icon (standardmäßig Such-Icon).
  final IconData? icon;

  /// Hintergrund anzeigen (true) oder transparent (false).
  final bool showBackground, showBorder;

  /// Tap-Handler für den gesamten Container (z. B. um eine Suche zu öffnen).
  final VoidCallback? onTap;

  /// Äußerer Padding um den Container herum.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // Theme-basiert (Dark/Light) für dynamische Farbwahl.
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap, // Gesamte Fläche klickbar.
      child: Padding(
        padding: padding,
        child: Container(
          // Füllt die verfügbare Breite des Geräts.
          width: TDeviceUtils.getScreenWidth(context),
          // Innenabstand innerhalb der "Suchleiste".
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            // Optionaler Hintergrund, abhängig vom Theme.
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius:

import 'package:hotshop/utils/constants/image_strings.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:hotshop/utils/constants/text_strings.dart';
import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

/// Header-Bereich für den Login-Screen:
/// - App-Logo (Theme-abhängig hell/dunkel)
/// - Titel & Untertitel aus den Text-Konstanten
class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Prüft, ob Dark Mode aktiv ist (für das passende Logo).
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Linksbündig ausrichten
      children: [
        // App-Logo (wechselt je nach Theme)
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),

        // Überschrift
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: TSizes.sm),

        // Untertitel/Beschreibung
        Text(
          TTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

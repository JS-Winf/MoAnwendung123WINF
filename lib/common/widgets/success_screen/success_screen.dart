import 'package:hotshop/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

/// Generische Erfolgs-/Bestätigungsseite:
/// - Zeigt eine Lottie-Animation, Titel, Untertitel
/// - Ein Full-Width-Button für die Weiteraktion
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,      // Pfad zur Lottie-Animation (Asset)
    required this.title,      // Überschrift
    required this.subtitle,   // Beschreibung/Untertitel
    required this.onPressed,  // Callback für den Button
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(          // Scrollbar, falls Inhalte den Screen übersteigen
        child: Padding(
          // Großzügiges Padding, basierend auf AppBar-Höhe (multipliziert mit 2)
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /* Image */
              // Lottie-Animation nimmt ~60% der Bildschirmbreite ein
              Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Title & Subtitle */
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Buttons */
              // Primärer Action-Button über die gesamte Breite
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue), // "Weiter"-Text aus Konstanten
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

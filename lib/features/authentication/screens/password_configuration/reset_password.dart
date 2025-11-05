import 'package:hotshop/utils/constants/image_strings.dart'; // Konstanten für Bild-Asset-Pfade (z. B. Illustrationen)
import 'package:hotshop/utils/constants/sizes.dart'; // App-weite Größen-/Abstands-Konstanten
import 'package:hotshop/utils/constants/text_strings.dart'; // Zentral verwaltete Text-Konstanten
import 'package:flutter/cupertino.dart'; // Cupertino-Widgets (z. B. iOS-Icons)
import 'package:flutter/material.dart'; // Material-Widgets
import 'package:get/get.dart'; // GetX für Navigation/State-Management

import '../../../../utils/helpers/helper_functions.dart'; // Helper (z. B. Bildschirmbreite/-höhe)

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar ohne automatische Zurück-Schaltfläche
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          // Schließen-Icon rechts in der AppBar; kehrt zur vorherigen Seite zurück
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        // Ermöglicht Scrollen, falls Inhalte den Bildschirm überragen
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace), // Außenabstand für den Seiteninhalt
          child: Column(
            children: [
              /* Image */
              Image(
                // Bestätigungs-/E-Mail-Illustration
                image: const AssetImage(TImages.deliveredEmailIllustration),
                // Bildbreite auf 60% der Bildschirmbreite begrenzen
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Title & Subtitle */
              Text(
                TTexts.changeYourPasswordTitle, // Titel: Hinweis zum Passwort ändern
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.changeYourPasswordSubtitle, // Untertitel: zusätzliche Erklärung/Anleitung
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Buttons */
              SizedBox(
                width: double.infinity, // Button in voller Breite
                child: ElevatedButton(
                  onPressed: (){}, // TODO: Aktion nach Abschluss (z. B. zurück zum Login)
                  child: const Text(TTexts.done), // „Fertig“-Button
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity, // Button in voller Breite
                child: TextButton(
                  onPressed: (){}, // TODO: E-Mail erneut senden auslösen
                  child: const Text(TTexts.resendEmail), // „E-Mail erneut senden“-Button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

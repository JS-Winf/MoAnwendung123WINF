import 'package:hotshop/utils/constants/sizes.dart'; // App-weite Größen-/Abstands-Konstanten
import 'package:hotshop/utils/constants/text_strings.dart'; // Zentral verwaltete Text-Konstanten (Titel, Labels, Buttons)
import 'package:flutter/material.dart'; // Flutter Material Widgets
import 'package:get/get.dart'; // GetX für Navigation/State-Management
import 'package:iconsax/iconsax.dart'; // Iconsax-Iconset

import 'reset_password.dart'; // Zielseite nach Absenden (Passwort zurücksetzen)

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // Standard-AppBar (zurück-Navigation etc.)
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace), // Außenabstand für den Seiteninhalt
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Texte linksbündig ausrichten
          children: [
            /* Headings */
            Text(
              TTexts.forgetPasswordTitle, // Überschrift „Passwort vergessen“
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems), // kleiner vertikaler Abstand
            Text(
              TTexts.forgetPasswordSubtitle, // Beschreibung/Anleitungstext
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2), // größerer Abschnitts-Abstand

            /* Text field */
            TextFormField(
              // Eingabefeld für die E-Mail-Adresse (keine Validatoren hier definiert)
              decoration: const InputDecoration(
                labelText: TTexts.email, // Feldbeschriftung „E-Mail“
                prefixIcon: Icon(Iconsax.direct_right), // E-Mail/„Senden“-Icon links im Feld
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections), // Abstand zum Button

            /* Submit Button */
            SizedBox(
              width: double.infinity, // Button nimmt die gesamte Breite ein
              child: ElevatedButton(
                // Beim Tippen: Navigiert zur ResetPassword-Seite und entfernt die aktuelle Seite aus dem Stack
                onPressed: () => Get.off(() => const ResetPassword()),
                child: const Text(TTexts.submit), // Button-Text „Absenden“
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:hotshop/common/widgets/success_screen/success_screen.dart'; // Success-Screen-Komponente (hier noch nicht verwendet)
import 'package:hotshop/data/repositories/authentication/authentication_repository.dart'; // Auth-Repository (Logout/Verifikation etc.)
import 'package:hotshop/features/authentication/controllers/signup/verify_email_controller.dart'; // Controller für E-Mail-Verifikationslogik
import 'package:hotshop/utils/constants/image_strings.dart'; // Konstanten für Asset-Bilder
import 'package:hotshop/utils/constants/sizes.dart'; // Abstands- & Layout-Konstanten
import 'package:hotshop/utils/constants/text_strings.dart'; // Textkonstanten
import 'package:flutter/cupertino.dart'; // iOS-Icons
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX für State, Navigation, Dependency Injection

import '../../../../utils/helpers/helper_functions.dart'; // Hilfsfunktionen (z. B. Bildschirmgröße)

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  // Optional übergebene E-Mail-Adresse des Nutzers
  final String? email;

  @override
  Widget build(BuildContext context) {
    // Initialisiert/verknüpft den GetX Controller für E-Mail-Verifikationsstatus
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // keine Standard-Zurück-Taste
          actions: [
            // X-Button oben rechts → loggt den User aus und verlässt den Screen
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace), // einheitlicher Außenabstand
                child: Column(
                  children: [
                    /* Image */
                    Image(
                      // E-Mail-Illustration
                      image: const AssetImage(TImages.deliveredEmailIllustration),
                      width: THelperFunctions.screenWidth() * 0.6, // 60% der Bildschirmbreite
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /* Title & Subtitle */
                    Text(
                      TTexts.confirmEmail, // „E-Mail bestätigen“
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Zeigt die E-Mail-Adresse an (falls verfügbar)
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    Text(
                      TTexts.confirmEmailSubtitle, // Hinweistext „Bitte prüfe dein Postfach …“
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /* Buttons */
                    SizedBox(
                      width: double.infinity, // voller Button-Breite
                      child: ElevatedButton(
                        // Prüft, ob die E-Mail bereits verifiziert wurde
                        onPressed: () => controller.checkEmailVerificationStatus(),
                        child: const Text(TTexts.tContinue), // „Weiter“
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Button zum Erneut-Senden der Bestätigungs-E-Mail
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async => await controller.sendEmailVerification(),
                        child: const Text(TTexts.resendEmail), // „E-Mail erneut senden“
                      ),
                    ),
                  ],
                ))));
  }
}

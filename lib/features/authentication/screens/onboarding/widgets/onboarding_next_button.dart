import 'package:hotshop/features/authentication/controllers/onboarding/onboarding_controller.dart'; // Zugriff auf den Onboarding-Controller (steuert z. B. das Weiterblättern)
import 'package:hotshop/utils/constants/colors.dart'; // App-spezifische Farbkonstanten (z. B. TColors.primary)
import 'package:hotshop/utils/constants/sizes.dart'; // Größen-/Abstands-Konstanten (z. B. TSizes.defaultSpace)
import 'package:hotshop/utils/device/device_utility.dart'; // Geräte-/UI-Hilfen (z. B. BottomNav-Bar-Höhe)
import 'package:hotshop/utils/helpers/helper_functions.dart'; // Allgemeine Helper (z. B. Dark-Mode-Erkennung)
import 'package:flutter/material.dart'; // Flutter Material-Widgets
import 'package:iconsax/iconsax.dart'; // Icon-Pack (Iconsax)

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Ermittelt, ob das aktuelle Theme im Dark Mode ist
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
        // Positioniert den Button relativ zum Stack-Container: rechts mit Standardabstand
        right: TSizes.defaultSpace,
        // Positioniert über der Bottom Navigation Bar, damit der Button nicht überlappt
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            // Beim Tippen: nächste Onboarding-Seite über den Controller aufrufen
            onPressed: () => OnboardingController.instance.nextPage(),
            // Button-Stil: runder (kreisförmiger) Button mit themenabhängiger Hintergrundfarbe
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                // Im Dark Mode: Primärfarbe der App, sonst: Schwarz
                backgroundColor: dark ? TColors.primary : Colors.black),
            // Pfeil-Icon aus Iconsax als Button-Inhalt
            child: const Icon(Iconsax.arrow_right_3)));
  }
}

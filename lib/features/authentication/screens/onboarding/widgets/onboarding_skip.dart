import 'package:hotshop/features/authentication/controllers/onboarding/onboarding_controller.dart'; // Zugriff auf den Onboarding-Controller (zum Überspringen/Steuern der Seiten)
import 'package:hotshop/utils/constants/sizes.dart'; // Konstanten für Abstände/Größen (z. B. defaultSpace)
import 'package:hotshop/utils/device/device_utility.dart'; // Geräte-Utilities (z. B. AppBar-Höhe)
import 'package:flutter/material.dart'; // Flutter UI Widgets

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        // Positioniert den "Skip"-Button oben rechts am Bildschirmrand
        top: TDeviceUtils.getAppBarHeight(), // Abstand nach unten entsprechend der AppBar-Höhe
        right: TSizes.defaultSpace, // Standard-Seitenabstand
        // TextButton, der die Onboarding-Sequenz überspringt
        child: TextButton(
            onPressed: () => OnboardingController.instance.skipPage(), // Skip-Logik aus Controller aufrufen
            child: const Text('Skip') // Text für den Button
        )
    );
  }
}

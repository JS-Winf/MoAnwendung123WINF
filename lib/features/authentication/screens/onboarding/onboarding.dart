import 'package:hotshop/features/authentication/controllers/onboarding/onboarding_controller.dart'; // GetX-Controller für die Onboarding-Logik (PageController, Navigation, Indikator-Update)
import 'package:hotshop/utils/constants/image_strings.dart'; // Bild-Asset-Konstanten (TImages.*)
import 'package:hotshop/utils/constants/text_strings.dart'; // Text-Konstanten für Titel/Untertitel (TTexts.*)
import 'package:flutter/material.dart'; // Flutter Material Widgets
import 'package:get/get.dart'; // GetX für State-Management/DI

import 'widgets/onboarding_dot_navigation.dart'; // Punkt-Navigation (SmoothPageIndicator)
import 'widgets/onboarding_next_button.dart'; // Kreisschaltfläche „Weiter“
import 'widgets/onboarding_page.dart'; // Einzelne Onboarding-Seite (Bild, Titel, Untertitel)
import 'widgets/onboarding_skip.dart'; // „Skip“-Button (überspringt Onboarding)

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Registriert/holt den OnboardingController via GetX (Dependency Injection)
    final controller = Get.put(OnboardingController());

    return Scaffold(
        body: Stack(
      children: [
        /* Horizontal Scrollable Pages */
        PageView(
          controller: controller.pageController,              // steuert die Seiten (blättern/animieren)
          onPageChanged: controller.updatePageIndicator,      // aktualisiert den Seitenindikator im Controller
          children: const [
            // Drei Onboarding-Seiten mit je Bild, Titel und Untertitel aus Konstanten
            OnboardingPage(
                image: TImages.onboardingImage1,
                title: TTexts.onboardingTitle1,
                subtitle: TTexts.onboardingSubtitle1),
            OnboardingPage(
                image: TImages.onboardingImage2,
                title: TTexts.onboardingTitle2,
                subtitle: TTexts.onboardingSubtitle2),
            OnboardingPage(
                image: TImages.onboardingImage3,
                title: TTexts.onboardingTitle3,
                subtitle: TTexts.onboardingSubtitle3),
          ],
        ),

        /* Skip Button */
        const OnboardingSkip(),              // oben rechts, überspringt das Onboarding

        /* Dot Navigation SmoothPageIndicator */
        const OnboardingDotNavigation(),     // zeigt den aktuellen Page-Index als Punkte an

        /* Circular Button */
        const OnboardingNextButton(),        // runder Button unten rechts, geht zur nächsten Seite
      ],
    ));
  }
}

import 'package:hotshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:hotshop/utils/constants/colors.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:hotshop/utils/device/device_utility.dart';
import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// Punkt-Navigation (Dots) für das Onboarding.
/// - Verankert per Positioned nahe der unteren Kante
/// - Reagiert auf Klicks (springt zur gewählten Seite)
/// - Nutzt SmoothPageIndicator mit ExpandingDotsEffect
class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance; // Zugriff auf PageController & Logik
    final dark = THelperFunctions.isDarkMode(context); // Theme-abhängige Farben

    return Positioned(
      // Positionierung oberhalb der Bottom-Navigation (falls vorhanden)
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,                               // Anzahl der Onboarding-Seiten
        controller: controller.pageController,  // Gekoppelter PageController
        onDotClicked: controller.dotNavigationClick, // Beim Tippen: Seite wechseln
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark, // Aktiver Dot je nach Theme
          dotHeight: 6,                                        // Höhe der Dots
        ),
      ),
    );
  }
}

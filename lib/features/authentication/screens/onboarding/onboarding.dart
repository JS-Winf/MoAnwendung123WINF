import 'package:hotshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:hotshop/utils/constants/image_strings.dart';
import 'package:hotshop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());


    return Scaffold(
        body: Stack(
      children: [
        /* Horizontal Scrollable Pages */
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
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
        const OnboardingSkip(),

        /* Dot Navigation SmoothPageIndicator */
        const OnboardingDotNavigation(),

        /* Circular Button */
        const OnboardingNextButton(),
      ],
    ));
  }
}



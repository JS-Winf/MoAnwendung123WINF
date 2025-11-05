import 'package:hotshop/features/authentication/controllers/signup/signup_controller.dart'; // Zugriff auf den SignupController (State & Logik)
import 'package:hotshop/utils/helpers/helper_functions.dart'; // Helper (z. B. Dark-Mode-Erkennung)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart'; // Farbkonstanten (TColors)
import '../../../../../utils/constants/sizes.dart'; // Abstands-/Größenkonstanten (TSizes)
import '../../../../../utils/constants/text_strings.dart'; // Textkonstanten (TTexts)

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    // Prüft, ob aktuell Dark Mode aktiv ist
    final dark = THelperFunctions.isDarkMode(context);
    // Greift auf die Singleton-Instanz des SignupControllers zu
    final controller = SignupController.instance;

    return Row(
      children: [
        // Checkbox mit fixer Größe
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                // Reaktiver Wert aus dem Controller (RxBool)
                value: controller.privacyPolicy.value,
                // Beim Tippen wird der Bool-Wert umgeschaltet
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: TSizes.spaceBtwItems),
        // Zusammengesetzter Text: "Ich stimme der Datenschutzrichtlinie und den Nutzungsbedingungen zu"
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ', // "Ich stimme zu"
              style: Theme.of(context).textTheme.bodySmall),
          // "Datenschutzrichtlinie" als klickbar wirkender (unterstrichener) Link-Stil
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary)),
          TextSpan(
              text: ' ${TTexts.and} ', // "und"
              style: Theme.of(context).textTheme.bodySmall),
          // "Nutzungsbedingungen" im gleichen Link-Stil
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary)),
        ]))
      ],
    );
  }
}

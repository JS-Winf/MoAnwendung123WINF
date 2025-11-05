import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

/// Social-Login-Buttons (Google & Facebook als Beispiel).
/// - Zeigt runde IconButtons mit Rahmen.
/// - Google-Button triggert `AuthenticationRepository.instance.loginWithGoogle()`.
class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Zentriert die Buttons horizontal
      children: [
        // Google-Login-Button (mit Rahmen + rundem Shape)
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            // Asynchroner Aufruf des Google-Logins über das Auth-Repository (Singleton)
            onPressed: () async =>
                await AuthenticationRepository.instance.loginWithGoogle(),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google), // Google-Logo (Asset)
            ),
          ),
        ),

        const SizedBox(width: TSizes.spaceBtwItems), // Abstand zwischen den Buttons

        // Facebook-Button (aktuell ohne Implementierung hinter onPressed)
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {}, // Platzhalter: hier könnte Facebook-Login kommen
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook), // Facebook-Logo (Asset)
            ),
          ),
        ),
      ],
    );
  }
}

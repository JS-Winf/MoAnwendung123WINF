import 'package:hotshop/common/widgets/login_signup/form_divider.dart'; // Trennlinie mit Text (z. B. "oder anmelden mit")
import 'package:hotshop/common/widgets/login_signup/social_buttons.dart'; // Social-Login-Buttons
import 'package:hotshop/utils/constants/sizes.dart'; // Abstands-/Größenkonstanten
import 'package:hotshop/utils/constants/text_strings.dart'; // Textkonstanten (Titel, Labels)
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Für .capitalize! (GetX String-Erweiterung)

import 'widgets/signup_form.dart'; // Das eigentliche Sign-up-Formular

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(), // einfache AppBar mit Standard-Zurück-Navigation
        body: SingleChildScrollView( // erlaubt Scrollen, falls Inhalte länger als der Screen sind
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace), // Außenabstand rund um den Inhalt
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Inhalte linksbündig
            children: [
              /* Title */
              Text(
                TTexts.signUpTitle, // Überschrift, z. B. „Konto erstellen“
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Form */
              const TSignupForm(), // Formular mit Vorname, Nachname, Username, E-Mail, Passwort + AGB
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Divider */
              TFormDivider(
                dividerText: TTexts.orSignUpWith.capitalize!, // "oder registrieren mit"
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /* Footer */
              const TSocialButtons(), // Buttons für Google/Apple/Facebook etc.
            ],
          ),
        )));
  }
}

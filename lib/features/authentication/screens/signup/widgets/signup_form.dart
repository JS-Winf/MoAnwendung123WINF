import 'package:hotshop/utils/validators/validation.dart'; // Validatoren für Form-Felder (E-Mail, Passwort, leere Texte)
import 'package:flutter/material.dart'; // Flutter Material Widgets
import 'package:get/get.dart'; // GetX für State-Management/DI/Reaktivität
import 'package:iconsax/iconsax.dart'; // Iconsax-Icon-Set

import '../../../../../utils/constants/sizes.dart'; // Abstands-/Größenkonstanten
import '../../../../../utils/constants/text_strings.dart'; // Textkonstanten (Labels, Buttontexte)
import '../../../controllers/signup/signup_controller.dart'; // Controller für Sign-up-Logik/State
import '../verify_email.dart'; // (Importiert, aktuell in diesem Widget nicht verwendet)
import 'terms_and_conditions_checkbox.dart'; // Checkbox-Komponente für AGB/Datenschutz

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Registriert/Holt den SignupController via GetX (stellt Controller & Refs bereit)
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey, // GlobalKey zur Formularvalidierung
        child: Column(
          children: [
            Row(
              children: [
                // Vorname
                Expanded(
                    child: TextFormField(
                  controller: controller.firstName, // TextEditingController
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value), // Pflichtfeld-Validierung
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName, // Label „Vorname“
                    prefixIcon: Icon(Iconsax.user), // Nutzer-Icon
                  ),
                )),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                // Nachname
                Expanded(
                    child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value), // Pflichtfeld-Validierung
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName, // Label „Nachname“
                    prefixIcon: Icon(Iconsax.user),
                  ),
                )),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /* Username */
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value), // Pflichtfeld-Validierung
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username, // Label „Benutzername“
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /* Email */
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value), // E-Mail-Format prüfen
              decoration: const InputDecoration(
                  labelText: TTexts.email, // Label „E-Mail“
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /* Password */
            Obx(
              // Reaktives Widget: reagiert auf controller.hidePassword (RxBool)
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value), // Passwortregeln prüfen
                obscureText: controller.hidePassword.value, // zeigt/verbirgt Passwort
                decoration: InputDecoration(
                  labelText: TTexts.password, // Label „Passwort“
                  prefixIcon: const Icon(Iconsax.password_check),
                  // Toggle-Icon zum Ein-/Ausblenden des Passworts
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash // aktuell verborgen
                            : Iconsax.eye,      // aktuell sichtbar
                      )),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /* Terms & Conditions */
            const TTermsAndConditionsCheckbox(), // Checkbox für AGB/Datenschutz
            const SizedBox(height: TSizes.spaceBtwSections),

            /* Signup button */
            SizedBox(
                width: double.infinity, // Button über volle Breite
                child: ElevatedButton(
                    onPressed: () => controller.signup(), // Sign-up-Flow auslösen (inkl. Validierung/Navi)
                    child: const Text(TTexts.createAccount))) // „Konto erstellen“-Text
          ],
        ));
  }
}

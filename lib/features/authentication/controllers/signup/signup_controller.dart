import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:hotshop/features/authentication/screens/signup/verify_email.dart';
import 'package:hotshop/utils/constants/image_strings.dart';
import 'package:hotshop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

/// Controller für den Signup-Prozess (GetX).
/// Verantwortlich für:
/// - Formularzustand & Validierung
/// - Datenschutz-Checkbox
/// - Netzwerkcheck
/// - Loading-Dialoge & Snackbars
/// - Delegation an das AuthenticationRepository (Auth0)
class SignupController extends GetxController {
  /// Singleton-Zugriff
  static SignupController get instance => Get.find();

  /// Reaktive UI-States
  final hidePassword = true.obs;   // Passwort ein-/ausblenden
  final privacyPolicy = false.obs; // Datenschutz/AGB akzeptiert?

  /// TextController für Formfelder
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  /// Key für Formular-Validierung
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Registrierung durchführen
  Future<void> signup() async {
    try {
      // 1) Vollbild-Loader anzeigen
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );

      // 2) Internetverbindung prüfen
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 3) Formular validieren
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 4) Datenschutz akzeptiert?
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackbar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // 5) Nutzer registrieren (Auth0 über Repository)
      await AuthenticationRepository.instance
          .registerWithEmailUsernameAndPassword(
        email.text.trim(),
        username.text,
        password.text.trim(),
      );

      // 6) Loader beenden
      TFullScreenLoader.stopLoading();

      // 7) Erfolgsmeldung anzeigen
      TLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      // 8) Zur E-Mail-Verifizierung navigieren
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Fehlerfall: Loader schließen & Fehlermeldung zeigen
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

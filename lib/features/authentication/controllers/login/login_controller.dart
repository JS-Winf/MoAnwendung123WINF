import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:hotshop/utils/helpers/network_manager.dart';
import 'package:hotshop/utils/popups/full_screen_loader.dart';
import 'package:hotshop/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/image_strings.dart';

/// Controller für den Login-Prozess (GetX).
/// Kümmert sich um:
/// - Formularzustand & Validierung
/// - "Remember me"-Speicherung
/// - Netzwerkcheck
/// - Loading-Dialoge
/// - Delegation an das AuthenticationRepository
class LoginController extends GetxController {
  /// Singleton-Zugriff über GetX
  static LoginController get instance => Get.find();

  /// Reaktive UI-States
  final rememberMe = false.obs;      // Checkbox "Angemeldet bleiben"
  final hidePassword = true.obs;     // Passwortfeld Sichtbarkeit

  /// Lokaler Speicher (GetStorage) für Remember-Me
  final localStorage = GetStorage();

  /// Text-Controller für E-Mail & Passwort
  final email = TextEditingController();
  final password = TextEditingController();

  /// GlobalKey für Formular-Validierung
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// E-Mail/Passwort Login-Flow
  Future<void> emailAndPasswordSignIn() async {
    try {
      // 1) Vollbild-Loader anzeigen
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...', 
        TImages.docerAnimation,
      );

      // 2) Internetverbindung prüfen
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 3) Formular validieren
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 4) Remember-Me: Zugangsdaten lokal speichern (optional)
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // 5) Login via AuthenticationRepository (Auth0 / Demo)
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // 6) Loader schließen
      TFullScreenLoader.stopLoading();

      // 7) Weiterleitung je nach Status (verifiziert / onboarding etc.)
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Fehlerbehandlung: Loader schließen & Snackbar mit Fehlermeldung
      TFullScreenLoader.stopLoading();
      print(e);
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

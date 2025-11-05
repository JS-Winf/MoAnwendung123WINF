import 'dart:async';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

/// Controller zur E-Mail-Verifizierung.
/// - Versendet (optional) Verifizierungs-E-Mails
/// - Pollt/verfolgt den Verifizierungsstatus
/// - Leitet nach erfolgreicher Verifizierung auf eine Success-Seite weiter
class VerifyEmailController extends GetxController {
  /// Singleton-Zugriff über GetX
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    // Beim Initialisieren sofort Auto-Redirect-Timer starten
    setTimerForAutoRedirect();
  }

  /// Verifizierungs-E-Mail senden (Delegation an das Repository).
  /// Zeigt passende Snackbars für Erfolg/Fehler.
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackbar(
        title: 'Email sent',
        message: 'Please Check your inbox and verify your email.',
      );
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Setzt einen periodischen Timer (alle 10s), der prüft,
  /// ob die E-Mail des Users verifiziert wurde.
  /// Bei Erfolg: Timer stoppen & SuccessScreen anzeigen.
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      final currentUser =
          await AuthenticationRepository.instance.currentUser();

      if (currentUser != null && (currentUser.isEmailVerified ?? false)) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manuelle Prüfung des Verifizierungsstatus (z. B. via Button).
  /// - Zeigt "Checking..." Hinweis
  /// - Leert den User-Cache, wartet kurz und lädt frische Profildaten
  /// - Bei verifiziert → SuccessScreen, sonst Fehlermeldung
  Future<void> checkEmailVerificationStatus() async {
    try {
      TLoaders.warningSnackbar(
        title: 'Checking...',
        message: 'Verifying your email status',
      );
      
      // Cache leeren, um frische Daten zu erzwingen
      final authRepo = AuthenticationRepository.instance;
      authRepo.clearUserCache();
      
      // Kurz warten, damit der Verifizierungsstatus bei Auth0 aktualisiert ist
      await Future.delayed(const Duration(seconds: 2));
      
      final currentUser = await authRepo.currentUser();

      if (currentUser != null && (currentUser.isEmailVerified ?? false)) {
        Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubtitle,
            onPressed: () => authRepo.screenRedirect()));
      } else {
        TLoaders.errorSnackbar(
          title: 'Email not verified', 
          message: 'Please check your email and click the verification link, then try again.'
        );
      }
    } catch (e) {
      // Allgemeiner Fehlerfall mit Handlungsempfehlung
      TLoaders.errorSnackbar(
        title: 'Error',
        message: 'Please try again or use the X button to login manually.',
      );
    }
  }
}

import 'package:hotshop/utils/constants/colors.dart'; // Farbkonstanten (TColors)
import 'package:hotshop/utils/helpers/helper_functions.dart'; // Helper (z. B. Dark-Mode-Erkennung)
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX (Get.context!, Get.snackbar)
import 'package:iconsax/iconsax.dart'; // Iconset

class TLoaders {
  // Blendet eine ggf. aktuell sichtbare Snackbar aus
  static hideSnackbar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  // Zeigt eine benutzerdefinierte „Toast“-ähnliche Snackbar mittig/unten
  static customToast({ required message }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,                             // flache Snackbar ohne Schatten
        duration: const Duration(seconds: 3),     // Anzeigezeit
        backgroundColor: Colors.transparent,      // transparenter Hintergrund für eigenen Container
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // pillenförmiger Stil
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.darkerGrey.withOpacity(0.9) // dunkler Hintergrund im Dark Mode
                : TColors.grey.withOpacity(0.9),      // heller Hintergrund im Light Mode
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge, // Theme-Font verwenden
            ),
          ),
        ),
      ),
    );
  }

  // Grüne/Erfolgs-Snackbar mit Check-Icon (unten)
  static successSnackbar({ required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,                    // per Wisch/Back wegwischbar
      shouldIconPulse: true,                  // Icon pulsiert
      colorText: TColors.white,               // Textfarbe
      backgroundColor: TColors.primary,       // Hintergrundfarbe (Primär)
      snackPosition: SnackPosition.BOTTOM,    // unten anzeigen
      duration: Duration(seconds: duration),  // konfigurierbare Dauer
      margin: const EdgeInsets.all(10),       // Außenabstand
      icon: const Icon(Iconsax.check, color: TColors.white), // Haken-Icon
    );
  }

  // Gelbe/Warn-Snackbar mit Warn-Icon (unten)
  static warningSnackbar({ required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.warning,       // Warnfarbe
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  // Rote/Fehler-Snackbar mit Warn-Icon (unten)
  static errorSnackbar({ required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.error,         // Fehlerfarbe
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }
}

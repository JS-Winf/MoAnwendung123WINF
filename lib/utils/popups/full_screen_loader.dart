import 'package:hotshop/utils/constants/colors.dart'; // Farbkonstanten (TColors)
import 'package:hotshop/utils/helpers/helper_functions.dart'; // Helper (z. B. Dark-Mode-Erkennung)
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX (für Get.context / Get.overlayContext)

import '../../common/widgets/loaders/animation_loader.dart'; // Custom Loader-Widget mit Animation

class TFullScreenLoader {
  // Öffnet einen modalen Fullscreen-Loading-Dialog mit Animation & Text
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,         // Nutzt Overlay-Context (über allem)
      barrierDismissible: false,            // Dialog kann nicht per Tap außerhalb geschlossen werden
      builder: (_) => PopScope(             // Verhindert Zurück-Navigation (z. B. Android Back)
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) 
              ? TColors.dark                  // Hintergrund im Dark Mode
              : TColors.white,                // Hintergrund im Light Mode
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),    // Abstand von oben (vertikale Zentrierung)
              TAnimationLoaderWidget(         // Animations-Loader mit Text
                text: text, 
                animation: animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Schliesst den aktuell geöffneten Loading-Dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

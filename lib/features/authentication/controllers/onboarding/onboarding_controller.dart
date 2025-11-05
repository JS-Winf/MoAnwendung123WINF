import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

/// Controller für das Onboarding (GetX).
/// Steuert Seitenwechsel, Dots-Indikator und das Überspringen/Abschließen.
class OnboardingController extends GetxController {
  /// Singleton-Zugriff
  static OnboardingController get instance => Get.find();

  /// PageView-Controller für die Onboarding-Seiten
  final pageController = PageController();

  /// Aktuelle Seite (reaktiv für UI-Updates, z. B. Dots)
  Rx<int> currentPageIndex = 0.obs;

  /// Beim Scrollen des PageView den aktuellen Index aktualisieren
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Klick auf einen Dot: zur entsprechenden Seite springen
  /// Hinweis: `jumpTo` erwartet Pixel; hier wird direkt `index` übergeben.
  /// (Beibehalten wie im Original; ggf. später auf `jumpToPage(index)` ändern.)
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Weiter zur nächsten Seite; bei letzter Seite:
  /// - Flag 'isFirstTime' setzen
  /// - zum Login weiterleiten
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Onboarding überspringen: direkt zur letzten Seite springen
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

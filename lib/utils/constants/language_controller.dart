import 'package:get/get.dart';
import 'app_strings.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find(); // Bequemer Zugriff auf die registrierte Instanz

  RxBool isGerman = false.obs; // Reaktiver Flag: true = Deutsch, false = Englisch

  void toggleLanguage(bool german) {
    isGerman.value = german;        // internen Rx-Status aktualisieren
    AppStrings.setGerman(german);   // Fallback in AppStrings mitziehen (falls Controller nicht verfügbar ist)
    update();                       // UI-Refresh für alle GetBuilder<LanguageController>
  }
}

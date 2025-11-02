import 'package:get/get.dart';
import 'app_strings.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find();
  
  RxBool isGerman = false.obs;
  
  void toggleLanguage(bool german) {
    isGerman.value = german;
    AppStrings.setGerman(german);
    update(); // Triggers UI rebuild
  }
}
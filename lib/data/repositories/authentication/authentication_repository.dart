import 'package:get/get.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  @override
  void onReady() {
    screenRedirect();
  }

  screenRedirect() async {
    // For demo: go directly to main app
    Get.offAll(() => const NavigationMenu());
  }

  Future<void> logout() async {
    Get.offAll(() => const LoginScreen());
  }
}
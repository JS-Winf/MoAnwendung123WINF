import 'package:get/get.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  @override
  void onReady() {
    screenRedirect();
  }

  screenRedirect() async {
    Get.offAll(() => const OnBoardingScreen());
  }
}
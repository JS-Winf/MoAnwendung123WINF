import 'dart:async';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    setTimerForAutoRedirect();
  }

  /// Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackbar(title: 'Email sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }

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

  Future<void> checkEmailVerificationStatus() async {
    try {
      TLoaders.warningSnackbar(title: 'Checking...', message: 'Verifying your email status');
      
      // Clear cache to force fresh data
      final authRepo = AuthenticationRepository.instance;
      authRepo.clearUserCache();
      
      // Wait a moment for Auth0 to update
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
      TLoaders.errorSnackbar(title: 'Error', message: 'Please try again or use the X button to login manually.');
    }
  }
}

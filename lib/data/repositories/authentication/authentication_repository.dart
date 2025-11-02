import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:hotshop/features/authentication/screens/signup/verify_email.dart';
import 'package:hotshop/navigation_menu.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/popups/loaders.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /* Variables */
  final deviceStorage = GetStorage();
  final Auth0 _auth0 = Auth0(
      'dev-7lmqopbf50r72pqb.eu.auth0.com', '0kVF5tYFusk5b6VsEjeh9uV0zFwD2IHC');

  /* Called from main.dart on app launch */
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /* Function to show relevant screen */
  screenRedirect() async {
    final isLoggedIn = await _auth0.credentialsManager.hasValidCredentials();

    if (isLoggedIn) {
      final userProfile = await currentUser();

      if (userProfile != null) {
        if (userProfile.isEmailVerified ?? false) {
          Get.offAll(() => const NavigationMenu());
        } else {
          Get.offAll(() => VerifyEmailScreen(email: userProfile.email));
        }
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', false);

      deviceStorage.read('isFirstTime') != false
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      final credentials = await _auth0.api.login(
          usernameOrEmail: email,
          password: password,
          connectionOrRealm: 'dartify-auth',
          scopes: {'openid', 'profile', 'email', 'offline_access'},
          audience: '');

      await _auth0.credentialsManager.storeCredentials(credentials);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final credentials = await _auth0.webAuthentication().login(
          scopes: {'openid', 'profile', 'email', 'offline_access'},
          audience: '',
          useEphemeralSession: true,
          parameters: {'connection': 'google-oauth2'});

      await _auth0.credentialsManager.storeCredentials(credentials);
      screenRedirect();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> registerWithEmailUsernameAndPassword(
      String email, String username, String password) async {
    try {
      await _auth0.api.signup(
          email: email,
          password: password,
          connection: 'dartify-auth',
          username: username);
      await loginWithEmailAndPassword(email, password);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      return;
      // TLoaders.errorSnackbar(title: 'Not implemented');
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfile?> currentUser() async {
    try {
      final hasCredentials =
          await _auth0.credentialsManager.hasValidCredentials();
      if (!hasCredentials) return null;

      final credentials = await _auth0.credentialsManager.credentials();
      final userProfile =
          await _auth0.api.userProfile(accessToken: credentials.accessToken);

      return userProfile;
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth0.credentialsManager.clearCredentials();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      rethrow;
    }
  }


}

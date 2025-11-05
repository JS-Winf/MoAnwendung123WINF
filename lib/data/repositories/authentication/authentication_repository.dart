// ============================================================================
// AUTHENTICATION REPOSITORY
// Zentrale Verwaltung der Benutzerauthentifizierung mit Auth0
// ============================================================================

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:hotshop/features/authentication/screens/signup/verify_email.dart';
import 'package:hotshop/navigation_menu.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/popups/loaders.dart';

/// Repository-Pattern für Authentifizierung
/// Implementiert Clean Architecture Prinzipien
/// Verwendet Auth0 für sichere, professionelle Authentifizierung
class AuthenticationRepository extends GetxController {
  /// Singleton Pattern - Eine Instanz für die gesamte App
  static AuthenticationRepository get instance => Get.find();

  // ========== KONFIGURATION ==========
  
  /// Lokaler Speicher für User Preferences und Cache
  final deviceStorage = GetStorage();
  
  /// Auth0 Client - Enterprise-Level Authentifizierung
  /// Domain und Client ID aus Auth0 Dashboard
  final Auth0 _auth0 = Auth0(
      'dev-7lmqopbf50r72pqb.eu.auth0.com', 
      '0kVF5tYFusk5b6VsEjeh9uV0zFwD2IHC'
  );
  
  /// Caching-System zur Reduzierung von API-Aufrufen
  /// Verhindert "Too Many Requests" Fehler
  UserProfile? _cachedUser;
  DateTime? _lastFetch;

  // ========== LIFECYCLE MANAGEMENT ==========
  
  /// Wird automatisch nach App-Start aufgerufen
  /// Entfernt Splash Screen und leitet zur passenden Seite weiter
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // Uncomment next line to force fresh login for demo
    // forceLogout();
    screenRedirect();
  }

  // ========== NAVIGATION LOGIC ==========
  
  /// Intelligente Weiterleitung basierend auf User-Status
  /// Prüft: Login-Status, Email-Verifizierung, Onboarding
  screenRedirect() async {
    try {
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
    } catch (e) {
      // Fallback for Android demo - skip auth
      print('Auth0 error, using demo mode: $e');
      deviceStorage.writeIfNull('isFirstTime', false);
      deviceStorage.read('isFirstTime') != false
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  // ========== AUTHENTIFIZIERUNG METHODEN ==========
  
  /// Email/Password Login mit Auth0
  /// Inklusive Demo-Mode für Präsentationszwecke
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
      print('Auth0 login error: $e');
      // Demo mode - simulate successful login
      if (email == 'demo@test.com' && password == 'demo123') {
        deviceStorage.write('demoUser', true);
        Get.offAll(() => const NavigationMenu());
        return;
      }
      rethrow;
    }
  }

  /// Google OAuth Login mit Auth0
  /// Verwendet WebAuthentication für sichere OAuth-Flows
  Future<void> loginWithGoogle() async {
    try {
      final credentials = await _auth0.webAuthentication(
        scheme: 'com.example.hotshop'
      ).login(
          scopes: {'openid', 'profile', 'email', 'offline_access'},
          audience: '',
          useEphemeralSession: false, // Force account selection
          parameters: {
            'connection': 'google-oauth2',
            'prompt': 'select_account' // Force Google account selection
          });

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

  // ========== USER MANAGEMENT ==========
  
  /// Benutzer-Profil abrufen mit intelligentem Caching
  /// Reduziert API-Aufrufe und verbessert Performance
  Future<UserProfile?> currentUser() async {
    try {
      // Return cached user if available and recent (within 5 minutes)
      if (_cachedUser != null && _lastFetch != null) {
        final timeDiff = DateTime.now().difference(_lastFetch!);
        if (timeDiff.inMinutes < 5) {
          return _cachedUser;
        }
      }

      final hasCredentials =
          await _auth0.credentialsManager.hasValidCredentials();
      if (!hasCredentials) return null;

      final credentials = await _auth0.credentialsManager.credentials();
      final userProfile =
          await _auth0.api.userProfile(accessToken: credentials.accessToken);

      // Cache the result
      _cachedUser = userProfile;
      _lastFetch = DateTime.now();
      
      return userProfile;
    } catch (e) {
      // Return cached user if API fails
      return _cachedUser;
    }
  }

  Future<void> logout() async {
    try {
      await _auth0.credentialsManager.clearCredentials();
      deviceStorage.remove('demoUser');
      deviceStorage.write('isFirstTime', true);
      _cachedUser = null;
      _lastFetch = null;
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      rethrow;
    }
  }

  // Force logout for demo
  Future<void> forceLogout() async {
    await _auth0.credentialsManager.clearCredentials();
    deviceStorage.erase(); // Clear all local storage
    _cachedUser = null;
    _lastFetch = null;
    Get.offAll(() => const LoginScreen());
  }

  // Clear user cache to force fresh data
  void clearUserCache() {
    _cachedUser = null;
    _lastFetch = null;
  }


}

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
        // Wenn eingeloggt: Profil abrufen (mit Cache)
        final userProfile = await currentUser();

        if (userProfile != null) {
          // E-Mail verifiziert? → in die App, sonst Verifizierungs-Screen
          if (userProfile.isEmailVerified ?? false) {
            Get.offAll(() => const NavigationMenu());
          } else {
            Get.offAll(() => VerifyEmailScreen(email: userProfile.email));
          }
        } else {
          // Fallback: zurück zum Login
          Get.offAll(() => const LoginScreen());
        }
      } else {
        // Nicht eingeloggt: First-Time-Flag prüfen → Onboarding oder Login
        deviceStorage.writeIfNull('isFirstTime', false);

        deviceStorage.read('isFirstTime') != false
            ? Get.offAll(() => const LoginScreen())
            : Get.offAll(const OnboardingScreen());
      }
    } catch (e) {
      // Fallback für Android-Demo: Auth überspringen und Onboarding/Login zeigen
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
      // Klassischer Resource Owner Password Flow (über Auth0 API)
      final credentials = await _auth0.api.login(
          usernameOrEmail: email,
          password: password,
          connectionOrRealm: 'dartify-auth',
          scopes: {'openid', 'profile', 'email', 'offline_access'},
          audience: '');

      // Credentials sicher im CredentialsManager ablegen
      await _auth0.credentialsManager.storeCredentials(credentials);
    } catch (e) {
      print('Auth0 login error: $e');
      // Demo mode - simuliert erfolgreichen Login ohne Auth0
      if (email == 'demo@test.com' && password == 'demo123') {
        deviceStorage.write('demoUser', true);
        Get.offAll(() => const NavigationMenu());
        return;
      }
      rethrow; // Fehler weitergeben, damit UI reagieren kann
    }
  }

  /// Google OAuth Login mit Auth0
  /// Verwendet WebAuthentication für sichere OAuth-Flows
  Future<void> loginWithGoogle() async {
    try {
      final credentials = await _auth0.webAuthentication(
        scheme: 'com.example.hotshop' // App-spezifisches URL-Scheme
      ).login(
          scopes: {'openid', 'profile', 'email', 'offline_access'},
          audience: '',
          useEphemeralSession: false, // Account-Auswahl erzwingen
          parameters: {
            'connection': 'google-oauth2',
            'prompt': 'select_account' // Google-Account Auswahl-Dialog
          });

      // Tokens speichern → persistenter Login
      await _auth0.credentialsManager.storeCredentials(credentials);
      screenRedirect(); // Nach erfolgreichem Login weiterleiten
    } catch (e) {
      rethrow;
    }
  }

  /// Registrierung via E-Mail, Username, Passwort (Auth0 Database Connection)
  Future<void> registerWithEmailUsernameAndPassword(
      String email, String username, String password) async {
    try {
      await _auth0.api.signup(
          email: email,
          password: password,
          connection: 'dartify-auth',
          username: username);
      // Nach Sign-up direkt einloggen
      await loginWithEmailAndPassword(email, password);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// E-Mail Verifikation anstoßen (noch nicht implementiert)
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
      // Wenn Cache vorhanden & jünger als 5 Minuten → Cache zurückgeben
      if (_cachedUser != null && _lastFetch != null) {
        final timeDiff = DateTime.now().difference(_lastFetch!);
        if (timeDiff.inMinutes < 5) {
          return _cachedUser;
        }
      }

      // Ohne gültige Credentials: kein User
      final hasCredentials =
          await _auth0.credentialsManager.hasValidCredentials();
      if (!hasCredentials) return null;

      // Tokens holen → Userprofil via Auth0 API laden
      final credentials = await _auth0.credentialsManager.credentials();
      final userProfile =
          await _auth0.api.userProfile(accessToken: credentials.accessToken);

      // Ergebnis cachen
      _cachedUser = userProfile;
      _lastFetch = DateTime.now();

      return userProfile;
    } catch (e) {
      // Bei API-Fehler: Falls vorhanden, alten Cache liefern
      return _cachedUser;
    }
  }

  /// Regulärer Logout: Tokens löschen, Demo-Flag entfernen, FirstTime zurücksetzen
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

  /// Forciertes Logout für Demo-Zwecke: Alles lokal löschen
  Future<void> forceLogout() async {
    await _auth0.credentialsManager.clearCredentials();
    deviceStorage.erase(); // Clear all local storage
    _cachedUser = null;
    _lastFetch = null;
    Get.offAll(() => const LoginScreen());
  }

  /// Cache leeren, um frische Profildaten zu erzwingen
  void clearUserCache() {
    _cachedUser = null;
    _lastFetch = null;
  }
}

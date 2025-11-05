// ============================================================================
// HOTSHOP - FLUTTER E-COMMERCE APP
// Haupteinstiegspunkt der Anwendung
// ============================================================================

import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

/// Hauptfunktion der App - Einstiegspunkt für die gesamte Anwendung
Future<void> main() async {
  // ========== APP INITIALISIERUNG ==========
  
  /// Flutter Widgets Binding initialisieren
  /// Notwendig für asynchrone Operationen vor runApp()
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage initialisieren
  /// Ermöglicht lokale Datenspeicherung (User Preferences, Cache, etc.)
  await GetStorage.init();

  /// Native Splash Screen beibehalten bis App vollständig geladen
  /// Verhindert weißen Bildschirm während des Ladens
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Authentication Repository als Singleton initialisieren
  /// Zentrale Verwaltung der Benutzerauthentifizierung mit Auth0
  Get.put(AuthenticationRepository());

  /// App starten mit Material Design, Themes und Lokalisierung
  runApp(const App());
}

import 'package:get/get.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

/// GetX-Controller zur Verwaltung der aktuell eingeloggten Nutzerdaten.
/// Holt das Profil über das AuthenticationRepository (Auth0) und bietet
/// komfortable Getter für Name, E-Mail und User-ID inkl. Demo-Fallbacks.
class UserController extends GetxController {
  /// Singleton-Zugriff: `UserController.instance`
  static UserController get instance => Get.find();

  /// Reaktives User-Profil (null, solange nichts geladen wurde).
  final Rx<UserProfile?> user = Rx<UserProfile?>(null);

  /// Ladezustand für UI (z. B. um Loader/Placeholders anzuzeigen).
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Beim Erstellen des Controllers direkt das User-Profil laden.
    fetchUserRecord();
  }

  /// Lädt das Benutzerprofil asynchron aus dem AuthenticationRepository.
  /// Setzt währenddessen isLoading und füllt anschließend das reaktive `user`.
  Future<void> fetchUserRecord() async {
    try {
      isLoading.value = true;
      final userRecord = await AuthenticationRepository.instance.currentUser();
      user.value = userRecord;
    } catch (e) {
      // Bei Fehlern: user auf null (UI kann entsprechend reagieren).
      user.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Bevorzugter Anzeigename:
  /// 1) `name` aus dem Profil
  /// 2) `nickname` aus dem Profil
  /// 3) Fallbacks für Demo/Nicht-Demo
  String get userName {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.name ?? 
           user.value?.nickname ?? 
           (isDemoUser ? 'Demo User' : 'HotShop User');
  }

  /// Bevorzugte E-Mail:
  /// 1) `email` aus dem Profil
  /// 2) Fallbacks für Demo/Nicht-Demo
  String get userEmail {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.email ?? 
           (isDemoUser ? 'demo@test.com' : 'user@hotshop.com');
  }

  /// Bevorzugte User-ID:
  /// 1) `sub` (Subject) aus dem Profil
  /// 2) Fallbacks für Demo/Nicht-Demo
  String get userId {
    final storage = AuthenticationRepository.instance.deviceStorage;
    final isDemoUser = storage.read('demoUser') == true;
    
    return user.value?.sub ?? 
           (isDemoUser ? 'demo|12345' : 'auth0|unknown');
  }
}

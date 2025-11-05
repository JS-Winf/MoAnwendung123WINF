import 'package:get/get.dart';

import '../utils/helpers/network_manager.dart';

/// GetX Bindings-Klasse.
/// Wird beim App-Start ausgeführt (in GetMaterialApp initialBinding gesetzt)
/// und registriert globale Abhängigkeiten/Services.
class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    // Registriert den NetworkManager als Singleton im GetX DI-Container.
    // Dadurch kann er überall via Get.find<NetworkManager>() genutzt werden.
    Get.put(NetworkManager());
  }
}

import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  /* Widgets binding */
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /* GetX local storage */
  await GetStorage.init();

  /* Await splash until other items load */
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /* Initialize Authentication Repository */
  Get.put(AuthenticationRepository());

  /* Load all the Material Design / Themes / Localizations / Bindings */
  runApp(const App());
}

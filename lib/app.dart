import 'package:hotshop/bindings/general_bindings.dart';
import 'package:hotshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hotshop/utils/theme/theme.dart';
import 'package:get/get.dart';

/// Root-Widget der App.
/// Setzt GetMaterialApp (GetX) als App-Shell, konfiguriert Theme & Bindings
/// und zeigt während der Initialisierung einen Splash/Loader an.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Entfernt das "Debug"-Banner in der rechten oberen Ecke.
      debugShowCheckedModeBanner: false,

      // Nutzt das System-Theme (hell/dunkel) des Geräts.
      themeMode: ThemeMode.system,

      // Definiert das helle App-Thema.
      theme: TAppTheme.lightTheme,

      // Definiert das dunkle App-Thema.
      darkTheme: TAppTheme.darkTheme,

      // Globale Abhängigkeiten/BX-Controller via GetX beim App-Start binden.
      initialBinding: GeneralBindings(),

      // Start-View: einfacher Splash/Loading-Screen mit Markenfarbe & Spinner.
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: TColors.white,
          ),
        ),
      ),
    );
  }
}

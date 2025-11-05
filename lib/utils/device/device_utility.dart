import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    // Blendet die Tastatur aus, indem der Fokus von Eingabefeldern entfernt wird
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    // Ändert die Statusbar-Farbe (nur Android sichtbar)
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    // Prüft Landscape anhand viewInsets (0 = Landscape ohne Tastatur)
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    // Prüft Portrait anhand viewInsets (≠0 = Portrait mit Tastatur)
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    // Wechselt zwischen Vollbild & normalem Modus
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static double getScreenHeight() {
    // Bildschirmhöhe basierend auf globalem Get.context
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    // Bildschirmbreite basierend auf übergebenem BuildContext
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRatio() {
    // Pixeldichte des Geräts
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight() {
    // Höhe der Statusleiste (Notch Bereich)
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    // Standardhöhe der Bottom Navigation Bar
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    // Standardhöhe der AppBar
    return kToolbarHeight;
  }

  static double getKeyboardHeight() {
    // Höhe der eingeblendeten Tastatur
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    // Prüft ob Tastatur sichtbar ist
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    // Prüft ob Gerät ein echtes mobiles Gerät ist
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    // Kurzes Vibrationsfeedback + erneute Vibration verzögert
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    // Sperrt die Bildschirmrotation auf angegebene Ausrichtungen
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    // Blendet die Systemstatusleiste komplett aus
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    // Zeigt die Systemstatusleiste wieder an
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    // Prüft Internetverbindung durch DNS Lookup
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    // Prüft ob Plattform iOS ist
    return Platform.isIOS;
  }

  static bool isAndroid() {
    // Prüft ob Plattform Android ist
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async {
    // Öffnet externe Links im Browser / externen App
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

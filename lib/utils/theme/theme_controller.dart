import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final themeMode = ThemeMode.system.obs;

  static const _key = 'themeMode'; // 'light' | 'dark' | 'system'

  @override
  void onInit() {
    final saved = _box.read<String>(_key);
    switch (saved) {
      case 'light': themeMode.value = ThemeMode.light; break;
      case 'dark' : themeMode.value = ThemeMode.dark;  break;
      default     : themeMode.value = ThemeMode.system;
    }
    super.onInit();
  }

  void setMode(ThemeMode mode) {
    themeMode.value = mode;
    _box.write(_key, switch (mode) {
      ThemeMode.light  => 'light',
      ThemeMode.dark   => 'dark',
      ThemeMode.system => 'system',
    });
  }

  void toggle() {
    // light -> dark -> system -> light ...
    switch (themeMode.value) {
      case ThemeMode.light:  setMode(ThemeMode.dark); break;
      case ThemeMode.dark:   setMode(ThemeMode.system); break;
      case ThemeMode.system: setMode(ThemeMode.light); break;
    }
  }
}

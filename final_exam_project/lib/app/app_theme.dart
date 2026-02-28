import 'package:flutter/material.dart';

class AppThemeController {
  AppThemeController._();

  /// Current theme mode (light / dark / system).
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(
    ThemeMode.system,
  );

  static void setSystem() => themeMode.value = ThemeMode.system;

  static void setLight() => themeMode.value = ThemeMode.light;

  static void setDark() => themeMode.value = ThemeMode.dark;
}

import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.dark);

  void toggleTheme() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
  }

  bool get isDarkMode => value == ThemeMode.dark;
}

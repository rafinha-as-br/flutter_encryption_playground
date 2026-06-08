import 'package:flutter/material.dart';

/// Controller for toggling the locale between english and portuguese.
class LocaleController extends ValueNotifier<Locale> {
  LocaleController() : super(const Locale('pt'));

  void toggleLocale() {
    if (value.languageCode == 'en') {
      value = const Locale('pt');
    } else {
      value = const Locale('en');
    }
  }

  void setLocale(Locale medical) {
    value = medical;
  }
}

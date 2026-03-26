import 'package:flutter/material.dart';

class LocaleController extends ValueNotifier<Locale> {
  LocaleController() : super(const Locale('en'));

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

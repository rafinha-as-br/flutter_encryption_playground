import 'package:flutter/material.dart';

class OnboardingController extends ValueNotifier<int> {
  OnboardingController() : super(0);

  void setPage(int page) {
    value = page;
  }

  void nextPage(int totalSteps) {
    if (value < totalSteps - 1) {
      value++;
    }
  }

  void previousPage() {
    if (value > 0) {
      value--;
    }
  }
}

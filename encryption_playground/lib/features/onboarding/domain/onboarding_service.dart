import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  final SharedPreferences _prefs;
  static const String _key = 'onboarding_completed';

  OnboardingService(this._prefs);

  bool isCompleted() {
    return _prefs.getBool(_key) ?? false;
  }

  Future<void> markCompleted() async {
    await _prefs.setBool(_key, true);
  }

  Future<void> reset() async {
    await _prefs.remove(_key);
  }
}


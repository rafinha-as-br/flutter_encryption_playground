import 'package:shared_preferences/shared_preferences.dart';

class TryOutGuideService {
  final SharedPreferences _prefs;

  TryOutGuideService(this._prefs);

  bool isCompleted(String featureKey) {
    return _prefs.getBool('guide_$featureKey') ?? false;
  }

  Future<void> markCompleted(String featureKey) async {
    await _prefs.setBool('guide_$featureKey', true);
  }

  Future<void> reset(String featureKey) async {
    await _prefs.remove('guide_$featureKey');
  }
}

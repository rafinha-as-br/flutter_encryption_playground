import 'package:shared_preferences/shared_preferences.dart';
import '../features/onboarding/domain/onboarding_service.dart';

class AppInjector {
  static late final OnboardingService onboardingService;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    onboardingService = OnboardingService(prefs);
  }
}


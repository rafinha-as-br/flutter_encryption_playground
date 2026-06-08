import 'package:encryption_playground/app/package_info_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/onboarding/domain/onboarding_service.dart';
import '../shared/guide/try_out_guide_service.dart';

class AppInjector {
  static late final OnboardingService onboardingService;
  static late final TryOutGuideService tryOutGuideService;
  static late final PackageInfoService packageInfoService;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    await PackageInfoService.init();
    onboardingService = OnboardingService(prefs);
    tryOutGuideService = TryOutGuideService(prefs);
  }
}


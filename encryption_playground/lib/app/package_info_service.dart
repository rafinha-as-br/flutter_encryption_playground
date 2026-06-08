import 'package:package_info_plus/package_info_plus.dart';

/// Singleton service responsible for providing information about the package.
class PackageInfoService{
  static PackageInfoService? _instance;
  late final PackageInfo packageInfo;
  PackageInfoService._();

  static Future<void> init() async{
    assert(_instance == null, 'PackageInfoService already initialized');
    _instance = PackageInfoService._();
    _instance?.packageInfo = await PackageInfo.fromPlatform();
  }



  static PackageInfoService get instance{
    assert (_instance != null, 'PackageInfoService not initialized');
    return _instance!;
  }

}
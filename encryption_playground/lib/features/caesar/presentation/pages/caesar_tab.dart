import 'package:flutter/material.dart';
import '../../../../app/app_routes.dart';
import 'caesar_try_out.dart';
import 'caesar_cipher_about_it.dart';

/// Service responsible for the nested navigation on the Caesar Cypher feature.
class CaesarNavigationService {
  CaesarNavigationService._internal();
  static final CaesarNavigationService _instance = CaesarNavigationService._internal();
  static CaesarNavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

/// Responsible on building the nested Navigator for Caesar Cypher feature
class CaesarTab extends StatelessWidget {
  const CaesarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CaesarNavigationService.instance.navigatorKey,
      initialRoute: AppRoutes.tryOut,
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case AppRoutes.tryOut:
            page = const CaesarTryOut();
            break;
          case AppRoutes.about:
            page = const CaesarCipherAboutIt();
            break;
          default:
            page = const CaesarTryOut();
        }
        return MaterialPageRoute(builder: (_) => page, settings: settings);
      },
    );
  }
}

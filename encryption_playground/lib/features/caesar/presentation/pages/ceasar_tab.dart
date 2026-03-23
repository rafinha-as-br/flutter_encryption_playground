import 'package:flutter/material.dart';
import 'ceasar_try_out.dart';
import 'ceasar_cypher_about_it.dart';

class CaesarNavigationService {
  CaesarNavigationService._internal();
  static final CaesarNavigationService _instance = CaesarNavigationService._internal();
  static CaesarNavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class CaesarTab extends StatelessWidget {
  const CaesarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CaesarNavigationService.instance.navigatorKey,
      initialRoute: 'try_out',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case 'try_out':
            page = const CeasarTryOutScreen();
            break;
          case 'about':
            page = const CeasarCypherAboutIt();
            break;
          default:
            page = const CeasarTryOutScreen();
        }
        return MaterialPageRoute(builder: (_) => page, settings: settings);
      },
    );
  }
}

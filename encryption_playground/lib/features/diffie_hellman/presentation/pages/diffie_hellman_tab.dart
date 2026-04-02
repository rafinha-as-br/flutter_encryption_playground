import 'package:flutter/material.dart';

import '../../../../app/app_routes.dart';
import 'diffie_hellman_about_it.dart';
import 'diffie_hellman_try_out.dart';

class DiffieHellmanNavigationService {
  DiffieHellmanNavigationService._internal();
  static final DiffieHellmanNavigationService _instance = DiffieHellmanNavigationService._internal();
  static DiffieHellmanNavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class DiffieHellmanTab extends StatelessWidget {
  const DiffieHellmanTab({super.key});



  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: DiffieHellmanNavigationService.instance.navigatorKey,
      initialRoute: AppRoutes.tryOut,
      onGenerateRoute: (settings){
        Widget page;
        switch(settings.name) {
          case AppRoutes.tryOut:
            page = const DiffieHellmanTryOut();
            break;
          case AppRoutes.about:
          page = const DiffieHellmanAboutIt();
          break;
          default:
            page = const DiffieHellmanTryOut();

        }
        return MaterialPageRoute(builder: (_) => page, settings: settings);
      },
    );
  }
}

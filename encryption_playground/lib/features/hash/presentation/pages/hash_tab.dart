import 'package:flutter/material.dart';

import 'hash_about_it.dart';
import 'hash_try_out.dart';

class HashNavigationService {
  HashNavigationService._internal();
  static final HashNavigationService _instance = HashNavigationService._internal();
  static HashNavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class HashTab extends StatelessWidget {
  const HashTab({super.key});



  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HashNavigationService.instance.navigatorKey,
      initialRoute: 'try_out',
      onGenerateRoute: (settings){
        Widget page;
        switch(settings.name) {
          case 'try_out':
            page = const HashTryOut();
            break;
          case 'about':
          page = const HashAboutIt();
          break;
          default:
            page = const HashTryOut();
        }
        return MaterialPageRoute(builder: (_) => page, settings: settings);
      }

    );
  }
}

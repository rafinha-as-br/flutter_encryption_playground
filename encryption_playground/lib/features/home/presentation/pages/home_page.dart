import 'package:encryption_playground/features/hash/presentation/pages/hash_try_out.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/asymmetric_suite_selection_page.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/cipher_suite_selection_page.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/symmetric_suite_selection_page.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'dashboard_page.dart';
import 'home_pages/home_page_mobile.dart';
import 'home_pages/home_page_tablet.dart';
import 'home_pages/home_page_desktop.dart';

class HomePageNavigationService {
  HomePageNavigationService._internal();

  static final instance =
  HomePageNavigationService._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  final routeTracker = RouteTracker();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: const HomePageMobile(),
      tablet: const HomePageTablet(),
      desktop: const HomePageDesktop(),
    );
  }
}

class HomePageNavigator extends StatelessWidget {
  HomePageNavigator({super.key});
  final routeTracker = RouteTracker();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HomePageNavigationService.instance.navigatorKey,
      observers: [
        HomePageNavigationService.instance.routeTracker,
      ],
      initialRoute: '/dashboard',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/dashboard':
        builder = (context) => DashboardPage();
        HomePageNavigationService.instance.routeTracker.currentRoute.value = '/dashboard';

        break;
      case '/ciphers':
        builder = (context) => CipherSuiteSelectionPage();
        break;
      case '/symmetric':
        builder = (context) => SymmetricSuiteSelectionPage();
        break;
      case '/asymmetric':
        builder = (context) => AsymmetricSuiteSelectionPage();
        break;
      case '/hash' :
        builder = (context) => HashTryOut();
        break;
      default:
        builder = (context) => DashboardPage();
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      settings: settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

}

class RouteTracker extends NavigatorObserver {
  final ValueNotifier<String> currentRoute =
  ValueNotifier('/dashboard');

  @override
  void didPush(Route route, Route? previousRoute) {
    currentRoute.value = route.settings.name ?? '';
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    currentRoute.value = newRoute?.settings.name ?? '';
  }
}




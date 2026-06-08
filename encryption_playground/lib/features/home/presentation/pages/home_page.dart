import 'package:encryption_playground/features/hash/presentation/pages/hash_tab.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/asymmetric_suite_selection_page.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/cipher_suite_selection_page.dart';
import 'package:encryption_playground/features/home/presentation/pages/suite_selections_pages/symmetric_suite_selection_page.dart';
import 'package:flutter/material.dart';


import '../../../../l10n/app_localizations.dart';
import '../../../../shared/responsive/responsive_breakpoints.dart';
import '../widgets/side_menu.dart';
import 'dashboard_page.dart';

/// Responsible for the nested navigation on the [HomePage] page.
class HomePageNavigationService {
  HomePageNavigationService._internal();

  static final instance = HomePageNavigationService._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  final routeTracker = RouteTracker();
}

/// Default home page for the app, responsible for home navigation and
/// side menu setup.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ResponsiveLayout.current(context);
    final isMobile = state == ResponsiveLayoutState.mobile;

    if (isMobile) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: const SideMenu(),
        body: HomePageNavigator(),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: HomePageNavigator(),
          ),
        ],
      ),
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
        break;
      case '/ciphers':
        builder = (context) => const CipherSuiteSelectionPage();
        break;
      case '/symmetric':
        builder = (context) => SymmetricSuiteSelectionPage();
        break;
      case '/asymmetric':
        builder = (context) => const AsymmetricSuiteSelectionPage();
        break;
      case '/hash':
        builder = (context) => const HashTab();
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
  final ValueNotifier<String> currentRoute = ValueNotifier('/dashboard');

  @override
  void didPush(Route route, Route? previousRoute) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentRoute.value = route.settings.name ?? '';
    });
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentRoute.value = newRoute?.settings.name ?? '';
    });
  }
}

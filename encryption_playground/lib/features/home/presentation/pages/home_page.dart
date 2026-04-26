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
  static final HomePageNavigationService _instance = HomePageNavigationService._internal();
  static HomePageNavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
  const HomePageNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HomePageNavigationService.instance.navigatorKey,
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
        builder = (context) => CipherSuiteSelectionPage();
        break;
      case '/symmetric':
        builder = (context) => SymmetricSuiteSelectionPage();
        break;
      case '/asymmetric':
        builder = (context) => AsymmetricSuiteSelectionPage();
        break;
      default:
        builder = (context) => DashboardPage();
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

}



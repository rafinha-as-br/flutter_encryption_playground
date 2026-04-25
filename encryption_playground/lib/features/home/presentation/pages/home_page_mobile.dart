import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'cipher_suite_selection_page.dart';
import 'symmetric_suite_selection_page.dart';
import 'asymmetric_suite_selection_page.dart';
import '../../../hash/presentation/pages/hash_tab.dart';
import '../../../caesar/presentation/pages/caesar_tab.dart';
import '../../../diffie_hellman/presentation/pages/diffie_hellman_tab.dart';
import '../widgets/side_menu.dart';

class HomePageMobile extends StatelessWidget {
  final String currentRoute;
  final ValueChanged<String> onNavigate;
  final GlobalKey<NavigatorState> contentNavigatorKey;

  const HomePageMobile({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
    required this.contentNavigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption Playground'),
      ),
      drawer: Drawer(
        child: SideMenu(
          currentRoute: currentRoute,
          onNavigate: (route) {
            Navigator.pop(context); // Close the drawer
            onNavigate(route);
          },
        ),
      ),
      body: Navigator(
        key: contentNavigatorKey,
        initialRoute: '/dashboard',
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/dashboard':
        builder = (context) => DashboardPage(contentNavigatorKey: contentNavigatorKey);
        break;
      case '/ciphers':
        builder = (context) => CipherSuiteSelectionPage(contentNavigatorKey: contentNavigatorKey);
        break;
      case '/symmetric':
        builder = (context) => SymmetricSuiteSelectionPage(contentNavigatorKey: contentNavigatorKey);
        break;
      case '/asymmetric':
        builder = (context) => AsymmetricSuiteSelectionPage(contentNavigatorKey: contentNavigatorKey);
        break;
      case '/hash':
        builder = (context) => const HashTab();
        break;
      case '/try_out_caesar':
        builder = (context) => const CaesarTab();
        break;
      case '/try_out_diffie_hellman':
        builder = (context) => const DiffieHellmanTab();
        break;
      default:
        builder = (context) => DashboardPage(contentNavigatorKey: contentNavigatorKey);
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

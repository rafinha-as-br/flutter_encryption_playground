import 'package:flutter/material.dart';
import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'home_page_mobile.dart';
import 'home_page_tablet.dart';
import 'home_page_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _contentNavigatorKey = GlobalKey<NavigatorState>();
  String _currentRoute = '/dashboard';

  void _onNavigate(String route) {
    if (_currentRoute == route) return;

    setState(() {
      _currentRoute = route;
    });

    _contentNavigatorKey.currentState?.pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: HomePageMobile(
        currentRoute: _currentRoute,
        onNavigate: _onNavigate,
        contentNavigatorKey: _contentNavigatorKey,
      ),
      tablet: HomePageTablet(
        currentRoute: _currentRoute,
        onNavigate: _onNavigate,
        contentNavigatorKey: _contentNavigatorKey,
      ),
      desktop: HomePageDesktop(
        currentRoute: _currentRoute,
        onNavigate: _onNavigate,
        contentNavigatorKey: _contentNavigatorKey,
      ),
    );
  }
}

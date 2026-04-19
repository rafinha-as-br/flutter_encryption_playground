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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: HomePageMobile(
        tabController: _tabController,
        navigatorKeys: _navigatorKeys,
      ),
      tablet: HomePageTablet(
        tabController: _tabController,
        navigatorKeys: _navigatorKeys,
      ),
      desktop: HomePageDesktop(
        tabController: _tabController,
        navigatorKeys: _navigatorKeys,
      ),
    );
  }
}

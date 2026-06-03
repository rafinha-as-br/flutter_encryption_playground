import 'package:encryption_playground/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../widgets/side_menu.dart';

/// Desktop layout for the [HomePage].
class HomePageDesktop extends StatelessWidget {

  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
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

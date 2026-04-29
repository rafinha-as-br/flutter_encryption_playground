import 'package:flutter/material.dart';
import '../home_page.dart';
import '../../widgets/side_menu.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({super.key,});

  @override
  Widget build(BuildContext context) {
    // On tablet, we can keep the side menu visible, same as desktop
    return Scaffold(
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: const HomePageNavigator(),
          ),
        ],
      ),
    );
  }

}

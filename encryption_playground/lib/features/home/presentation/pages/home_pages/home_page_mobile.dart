import 'package:flutter/material.dart';
import '../../widgets/side_menu.dart';
import '../home_page.dart';

class HomePageMobile extends StatelessWidget {

  const HomePageMobile({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption Playground'),
      ),
      drawer: SideMenu(),
      body: HomePageNavigator(),
    );
  }

}

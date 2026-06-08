import 'package:flutter/material.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../widgets/side_menu.dart';
import '../home_page.dart';

/// Mobile layout for the [HomePage].
class HomePageMobile extends StatelessWidget {

  const HomePageMobile({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      drawer: SideMenu(),
      body: HomePageNavigator(),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/locale_controller.dart';
import '../../../../app/theme_controller.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../caesar/presentation/pages/caesar_tab.dart';
import '../../../diffie_hellman/presentation/pages/diffie_hellman_tab.dart';
import '../../../hash/presentation/pages/hash_tab.dart';

class HomePageMobile extends StatelessWidget {
  final TabController tabController;
  final List<GlobalKey<NavigatorState>> navigatorKeys;

  const HomePageMobile({
    super.key,
    required this.tabController,
    required this.navigatorKeys,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: const Icon(Icons.info_outline),
            tooltip: 'About the Project',
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeController>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeController>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          const SizedBox(width: 7),
          ElevatedButton(
            onPressed: () {
              context.read<LocaleController>().toggleLocale();
            },
            child: Row(
              children: [
                const Icon(Icons.language),
                Text(' - ${l10n.localeName}')
              ],
            ),
          ),
          const SizedBox(width: 7),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: l10n.caesar, icon: const Icon(Icons.security)),
            Tab(text: l10n.diffieHellman, icon: const Icon(Icons.vpn_key)),
            Tab(text: l10n.hash, icon: const Icon(Icons.fingerprint)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe to avoid navigator conflicts
        children: [
          _buildTab(0, const CaesarTab()),
          _buildTab(1, const DiffieHellmanTab()),
          _buildTab(2, const HashTab()),
        ],
      ),
    );
  }

  Widget _buildTab(int index, Widget rootPage) {
    return Navigator(
      key: navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => rootPage,
        );
      },
    );
  }
}

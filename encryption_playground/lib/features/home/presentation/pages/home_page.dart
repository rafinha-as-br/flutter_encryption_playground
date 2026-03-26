import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../caesar/presentation/pages/ceasar_tab.dart';
import '../../../diffie_hellman/presentation/pages/diffie_hellman_tab.dart';
import '../../../hash/presentation/pages/hash_tab.dart';
import '../../../../app/locale_controller.dart';
import '../../../../app/theme_controller.dart';

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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
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
          ElevatedButton(
            onPressed: (){
              context.read<LocaleController>().toggleLocale();
            },
            child: Row(
              children: [
                const Icon(Icons.language),
                Text(l10n.localeName == 'pt'? ' - PT' : ' - EN')
              ],
            )
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.caesar, icon: const Icon(Icons.security)),
            Tab(text: l10n.diffieHellman, icon: const Icon(Icons.vpn_key)),
            Tab(text: l10n.hash, icon: const Icon(Icons.fingerprint)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
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
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => rootPage,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../../caesar/presentation/pages/ceasar_tab.dart';
import '../../../diffie_hellman/presentation/pages/diffie_hellman_page.dart';
import '../../../hash/presentation/pages/hash_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption Playground'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Caesar', icon: Icon(Icons.security)),
            Tab(text: 'Diffie-Hellman', icon: Icon(Icons.vpn_key)),
            Tab(text: 'Hash', icon: Icon(Icons.fingerprint)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe to avoid navigator conflicts
        children: [
          _buildTab(0, const CaesarTab()),
          _buildTab(1, const DiffieHellmanPage()),
          _buildTab(2, const HashPage()),
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

import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../shared/theme/app_colors.dart';
import '../../widgets/feature_card.dart';

class AsymmetricSuitSelectionNavigationService {
  AsymmetricSuitSelectionNavigationService._internal();
  static final AsymmetricSuitSelectionNavigationService _instance = AsymmetricSuitSelectionNavigationService._internal();
  static AsymmetricSuitSelectionNavigationService get instance => _instance;

}

class AsymmetricSuiteSelectionPage extends StatefulWidget {
  const AsymmetricSuiteSelectionPage({super.key});

  @override
  State<AsymmetricSuiteSelectionPage> createState() => _AsymmetricSuiteSelectionPageState();
}

class _AsymmetricSuiteSelectionPageState extends State<AsymmetricSuiteSelectionPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// nested navigator builder
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      initialRoute: '/suitePage',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  // route generator
  Route _onGenerateRoute(RouteSettings settings){
    WidgetBuilder builder;
    switch(settings.name){
      case '/suitePage':
        builder = (context) => _suiteSelectionPageView();
        break;
      case '/diffie-hellman_tab':
        builder = (context) => DiffieHellmanTab();
        break;

      // future new asymmetric algorithms will have their routes called here!

      default:
        builder = (context) => _suiteSelectionPageView();
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  /// suite selection page view
  Widget _suiteSelectionPageView(){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Asymmetric Suite',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Algorithms that require two separate keys, one of which is secret (or private) and one of which is public.',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.darkOnSurfaceVariant,
            ),
          ),
          const SizedBox(height: 48),

          // Feature Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 800) {
                crossAxisCount = 2;
              }

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.85,
                children: [
                  FeatureCard(
                    icon: Icons.vpn_key_outlined,
                    title: 'Diffie-Hellman',
                    description: 'A method of securely exchanging cryptographic keys over a public channel.',
                    buttonText: 'Try out',
                    onPressed: () => _navigatorKey.currentState?.pushReplacementNamed('/diffie-hellman_tab'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}


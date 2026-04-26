import 'package:encryption_playground/features/caesar/presentation/pages/caesar_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../shared/theme/app_colors.dart';
import '../../widgets/feature_card.dart';

class CipherSuiteSelectionPage extends StatelessWidget {
  CipherSuiteSelectionPage({super.key});

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      initialRoute: '/suitePage',
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/suitePage':
        builder = (context) => _suiteSelectionPageView();
        break;
      case '/try_out_caesar':
        builder = (context) => const CaesarTab();
        break;

      // future new cipher algorithms will have their routes called here!

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

  Widget _suiteSelectionPageView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cipher Suite',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Substitution and transposition ciphers, classical encryption methods.',
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
                    icon: Icons.sort_by_alpha,
                    title: 'Caesar Cipher',
                    description: 'A classic substitution cipher where each letter is shifted by a fixed number of positions.',
                    buttonText: 'Try out',
                    onPressed: () => _navigatorKey.currentState?.pushNamed('/try_out_caesar'),
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
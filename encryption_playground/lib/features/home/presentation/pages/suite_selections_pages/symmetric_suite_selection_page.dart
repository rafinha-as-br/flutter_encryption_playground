// lib/features/home/presentation/pages/suite_selections_pages/symmetric_suite_selection_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../shared/theme/app_colors.dart';
import '../../widgets/feature_card.dart';

class SymmetricSuiteSelectionPage extends StatelessWidget {
  SymmetricSuiteSelectionPage({super.key});
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

      // future new symmetric algorithms will have their routes called here!

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
            'Symmetric Suite',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Algorithms that use the same cryptographic keys for both encryption of plaintext and decryption of ciphertext.',
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
                    icon: Icons.lock_outline,
                    title: 'AES (Coming Soon)',
                    description: 'Advanced Encryption Standard is a symmetric block cipher chosen by the U.S. government to protect classified information.',
                    buttonText: 'Coming Soon',
                    onPressed: () {},
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
import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/feature_card.dart';
import 'home_page.dart';


/// Shows all the suite selection options.
class DashboardPage extends StatelessWidget {

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          DefaultContainer(
            child: Row(
            children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeTitle,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.welcomeDescription,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Navigate to root /about
                          Navigator.of(context, rootNavigator: true).pushNamed('/about');
                        },
                        icon: const Icon(Icons.info_outline),
                        label: Text(AppLocalizations.of(context)!.learnMoreAboutProject),
                      ),
                    ],
                ),
              ),
            ],
          )
          ),

          const SizedBox(height: 48),

          Text(
            AppLocalizations.of(context)!.exploreFeatures,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),

          const SizedBox(height: 24),

          // Feature Cards Grid
          _cardsGrid(),
        ],
      ),
    );
  }

  Widget _cardsGrid(){
    return LayoutBuilder(
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
              icon: Icons.security_outlined,
              title: AppLocalizations.of(context)!.cipherSuite,
              description: AppLocalizations.of(context)!.cipherSuiteDescription,
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/ciphers'),
            ),
            FeatureCard(
              icon: Icons.sync_alt_outlined,
              title: AppLocalizations.of(context)!.symmetricSuite,
              description: AppLocalizations.of(context)!.symmetricSuiteDescription,
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/symmetric'),
            ),
            FeatureCard(
              icon: Icons.vpn_key_outlined,
              title: AppLocalizations.of(context)!.asymmetricSuite,
              description: AppLocalizations.of(context)!.asymmetricSuiteDescription,
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/asymmetric'),
            ),
            FeatureCard(
              icon: Icons.fingerprint_outlined,
              title: AppLocalizations.of(context)!.hashSuite,
              description: AppLocalizations.of(context)!.hashSuiteDescription,
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/hash'),
            ),
          ],
        );
      },
    );
  }

}



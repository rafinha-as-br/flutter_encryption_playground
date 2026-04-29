import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/theme/app_colors.dart';
import '../widgets/feature_card.dart';
import 'home_page.dart';

/*
* TODO: Place the texts of this page into the internacionalization files
* */

class DashboardPage extends StatelessWidget {

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'Welcome to Encryption Playground',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkOnSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Explore cryptographic algorithms, see how they work under the hood, and test them out interactively.',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.darkOnSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Navigate to root /about
                          Navigator.of(context, rootNavigator: true).pushNamed('/about');
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Learn more about the project'),
                      ),
                    ],
                ),
              ),
            ],
          )
          ),

          const SizedBox(height: 48),

          Text(
            'Explore Features',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
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
              title: 'Cipher Suite',
              description: 'Explore classic and modern substitution ciphers like the Caesar cipher.',
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/ciphers'),
            ),
            FeatureCard(
              icon: Icons.sync_alt_outlined,
              title: 'Symmetric Suite',
              description: 'Test symmetric encryption algorithms where the same key encrypts and decrypts.',
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/symmetric'),
            ),
            FeatureCard(
              icon: Icons.vpn_key_outlined,
              title: 'Asymmetric Suite',
              description: 'Learn about public-key cryptography and key exchange protocols like Diffie-Hellman.',
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/asymmetric'),
            ),
            FeatureCard(
              icon: Icons.fingerprint_outlined,
              title: 'Hash Suite',
              description: 'Generate cryptographic hashes using MD5, SHA-1, SHA-256 and more.',
              onPressed: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/hash'),
            ),
          ],
        );
      },
    );
  }

}



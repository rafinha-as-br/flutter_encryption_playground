import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../shared/theme/app_colors.dart';
import '../../widgets/feature_card.dart';

class CipherSuiteSelectionPage extends StatelessWidget {
  final GlobalKey<NavigatorState> contentNavigatorKey;

  const CipherSuiteSelectionPage({super.key, required this.contentNavigatorKey});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => contentNavigatorKey.currentState?.pushReplacementNamed('/try_out_caesar'),
                  ),
                  // Future ciphers can be added here
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

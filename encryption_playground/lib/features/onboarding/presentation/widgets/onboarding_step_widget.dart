import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/responsive/responsive_breakpoints.dart';
import '../../../../app/app_layout_config.dart';

class OnboardingStepWidget extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const OnboardingStepWidget({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveLayout.isMobile(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LayoutConfig.maxInputWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isMobile ? 80 : 120,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 48),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 16 : 18,
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

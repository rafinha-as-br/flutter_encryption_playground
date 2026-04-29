import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/theme/app_colors.dart';

class SharedHeader extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onAboutPressed;

  const SharedHeader({
    super.key,
    required this.title,
    required this.description,
    required this.onAboutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkOnSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.darkOnSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: onAboutPressed,
                  icon: const Icon(Icons.info_outline),
                  label: const Text('About it'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';

class CaesarAlphabetViz extends StatelessWidget {
  final int shift;
  const CaesarAlphabetViz({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alphabet Transformation',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(26, (index) {
                final originalChar = alphabet[index];
                final shiftedIndex = (index + shift) % 26;
                final shiftedChar = alphabet[shiftedIndex < 0 ? shiftedIndex + 26 : shiftedIndex];

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.darkSurfaceContainerHigh,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          originalChar,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.darkOnSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Icon(Icons.arrow_downward, size: 16, color: AppColors.darkPrimary),
                      const SizedBox(height: 8),
                      Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.darkPrimary.withAlpha(25),
                          border: Border.all(color: AppColors.darkPrimary),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          shiftedChar,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.darkPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

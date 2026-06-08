import 'package:encryption_playground/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget responsible for displaying the Caesar Alphabet Visualization
class CaesarAlphabetViz extends StatelessWidget {
  final int shift;
  const CaesarAlphabetViz({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.alphabetTransformation,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
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
                          color: colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          originalChar,
                          style: GoogleFonts.jetBrainsMono(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Icon(Icons.arrow_downward, size: 16, color: colorScheme.primary),
                      const SizedBox(height: 8),
                      Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withAlpha(25),
                          border: Border.all(color: colorScheme.primary),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          shiftedChar,
                          style: GoogleFonts.jetBrainsMono(
                            color: colorScheme.primary,
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

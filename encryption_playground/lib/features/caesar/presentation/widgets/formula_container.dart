import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/widgets/default_container.dart';
import '../../../../l10n/app_localizations.dart';

/// Widget responsible for displaying the formula container
class FormulaContainer extends StatelessWidget {
  const FormulaContainer({super.key, required this.isEncrypting});
  final bool isEncrypting;


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultContainer(
        child: Tooltip(
          message: AppLocalizations.of(context)!.tooltipCaesarFormula,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Formula',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isEncrypting
                    ? 'E_n(x) = (x + n) mod 26'
                    : 'D_n(x) = (x - n) mod 26',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 16,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        )
    );
  }
}

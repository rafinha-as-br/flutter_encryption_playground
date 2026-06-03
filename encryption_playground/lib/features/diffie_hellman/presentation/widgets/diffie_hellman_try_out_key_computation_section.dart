import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../diffie_hellman_controller.dart';

/// Responsible for displaying the Key Computation section for the [DiffieHellmanTryOut] page.
class DHTryOutKeyComputationSection extends StatelessWidget {
  const DHTryOutKeyComputationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.keyComputationTitle,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),

          // User A Computation
          _buildComputationVisual(
            context,
            AppLocalizations.of(context)!.userAComputesSharedKey,
            's = (B^a) mod P',
            controller.sharedSecretAController,
            colorScheme.primary,
            '${AppLocalizations.of(context)!.sharedSecret} (s)',
          ),
          const SizedBox(height: 24),

          // User B Computation
          _buildComputationVisual(
            context,
            AppLocalizations.of(context)!.userBComputesSharedKey,
            's = (A^b) mod P',
            controller.sharedSecretBController,
            colorScheme.secondary,
            '${AppLocalizations.of(context)!.sharedSecret} (s)',
          ),

          const SizedBox(height: 48),

          // Reset Button at the bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => controller.reset(),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.resetParameters, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComputationVisual(BuildContext context, String label, String formula, TextEditingController secretController, Color accentColor, String hintText) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formula,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: secretController,
            readOnly: true,
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(Icons.lock_outline, color: accentColor, size: 20),
                fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

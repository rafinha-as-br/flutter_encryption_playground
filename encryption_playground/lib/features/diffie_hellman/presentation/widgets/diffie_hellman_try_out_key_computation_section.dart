import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../shared/theme/app_colors.dart';
import '../diffie_hellman_controller.dart';

class DHTryOutKeyComputationSection extends StatelessWidget {
  const DHTryOutKeyComputationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();

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
            '3. Key Computation',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 24),

          // User A Computation
          _buildComputationVisual(
            'User A computes shared key:',
            's = (B^a) mod P',
            controller.sharedSecretAController,
            AppColors.darkPrimary,
          ),
          const SizedBox(height: 24),

          // User B Computation
          _buildComputationVisual(
            'User B computes shared key:',
            's = (A^b) mod P',
            controller.sharedSecretBController,
            AppColors.darkSecondary,
          ),

          const SizedBox(height: 48),

          // Reset Button at the bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => controller.reset(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPrimary,
                foregroundColor: AppColors.darkSurface,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Parameters', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComputationVisual(String label, String formula, TextEditingController secretController, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainerHigh,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.darkOnSurfaceVariant,
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
                hintText: 'Shared Secret (s)',
                prefixIcon: Icon(Icons.lock_outline, color: accentColor, size: 20),
                fillColor: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}

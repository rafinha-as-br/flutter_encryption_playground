import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../diffie_hellman_controller.dart';

/// Responsible for displaying the Global Parameters for the [DiffieHellmanTryOut] page.
class DHGlobalParametersSection extends StatelessWidget {
  const DHGlobalParametersSection({super.key});

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
            AppLocalizations.of(context)!.globalParametersTitle,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildParameterInput(
            controller.pController,
            AppLocalizations.of(context)!.primeModulus,
            AppLocalizations.of(context)!.primeModulusHint,
                (val) => controller.p = int.tryParse(val),
          ),

          const SizedBox(height: 16),

          _buildParameterInput(
            controller.gController,
            AppLocalizations.of(context)!.generatorLabel,
            AppLocalizations.of(context)!.generatorHint,
                (val) => controller.g = int.tryParse(val),
          )
        ],
      ),
    );
  }

  Widget _buildParameterInput(TextEditingController textController, String label, String hint, ValueChanged<String> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.darkOnSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.black
          ),
        ),
      ],
    );
  }
}


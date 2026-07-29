import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../diffie_hellman_controller.dart';

/// Responsible for displaying the Global Parameters for the [DiffieHellmanTryOut] page.
class DHGlobalParametersSection extends StatelessWidget {
  const DHGlobalParametersSection({super.key});

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
            AppLocalizations.of(context)!.globalParametersTitle,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildParameterInput(
            context,
            controller.pController,
            AppLocalizations.of(context)!.primeModulus,
            AppLocalizations.of(context)!.primeModulusHint,
            (val) => controller.p = int.tryParse(val),
            tooltip: AppLocalizations.of(context)!.tooltipDhPrime,
          ),

          const SizedBox(height: 16),

          _buildParameterInput(
            context,
            controller.gController,
            AppLocalizations.of(context)!.generatorLabel,
            AppLocalizations.of(context)!.generatorHint,
            (val) => controller.g = int.tryParse(val),
            tooltip: AppLocalizations.of(context)!.tooltipDhGenerator,
          ),

          if (controller.gController.text.isNotEmpty && !controller.isGPrimitiveRoot) ...[
            const SizedBox(height: 12),
            _buildInfoBanner(context, AppLocalizations.of(context)!.gNotPrimitiveRootInfo),
          ],
        ],
      ),
    );
  }

  Widget _buildParameterInput(BuildContext context, TextEditingController textController, String label, String hint, ValueChanged<String> onChanged, {String? tooltip}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        if (tooltip != null)
          Tooltip(
            message: tooltip,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hint,
                  fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white
              ),
            ),
          )
        else
          TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hint,
                fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white
            ),
          ),
      ],
    );
  }

  Widget _buildInfoBanner(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: colorScheme.tertiary),
      ),
      child: Text(
        message,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}


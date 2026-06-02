import 'package:encryption_playground/features/caesar/presentation/widgets/shift_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/theme/app_colors.dart';
import '../../../../../shared/widgets/shared_header.dart';
import '../../caesar_controller.dart';
import '../../widgets/caesar_alphabet_viz.dart';
import '../../widgets/formula_container.dart';
import '../../widgets/input_section.dart';
import '../caesar_tab.dart';

class CaesarTryOutMobile extends StatelessWidget {
  final String resultValue;
  final String textValue;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String> onKeyChanged;
  final VoidCallback onSwapPressed;
  final ValueChanged<double> onSliderChanged;

  const CaesarTryOutMobile({
    super.key,
    required this.resultValue,
    required this.textValue,
    required this.onTextChanged,
    required this.onKeyChanged,
    required this.onSwapPressed,
    required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<CaesarController>(builder: (context, controller, child) {
      final isEncrypting = controller.isEncrypting;
      final shiftValue = controller.key ?? 3;

      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SharedHeader(
                title: 'Caesar Cipher',
                description: 'A classic substitution cipher where each letter in the plaintext is shifted a certain number of places down the alphabet.',
                onAboutPressed: () {
                  CaesarNavigationService.instance.navigatorKey.currentState
                      ?.pushNamed(AppRoutes.about);
                },
              ),
              const SizedBox(height: 32),

              // Shift Control & Formula
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // shift control
                  ShiftControl(
                    onKeyChanged: onKeyChanged,
                  ),
                  const SizedBox(height: 24),

                  // formula
                  FormulaContainer(isEncrypting: isEncrypting)
                ],
              ),
              const SizedBox(height: 24),

              CaesarAlphabetViz(shift: isEncrypting ? shiftValue : -shiftValue),
              const SizedBox(height: 32),

              // Inputs
              Column(
                children: [
                  InputSection.input(
                    onTextChanged: onTextChanged,
                    isEncrypting: isEncrypting,
                    resultValue: resultValue,
                    textValue: textValue,
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                          'Swap',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkOnSurface,
                          )
                      ),
                      IconButton(
                        onPressed: onSwapPressed,
                        icon: const Icon(Icons.swap_vert, size: 32, color: AppColors.darkPrimary),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  InputSection.result(
                      onTextChanged: onTextChanged,
                      isEncrypting: isEncrypting,
                      resultValue: resultValue,
                    textValue: textValue,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

}

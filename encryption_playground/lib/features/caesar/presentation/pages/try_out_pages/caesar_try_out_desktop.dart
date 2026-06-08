import 'package:encryption_playground/features/caesar/presentation/pages/caesar_try_out.dart';
import 'package:encryption_playground/features/caesar/presentation/widgets/shift_control.dart';
import 'package:flutter/material.dart';
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
import '../../../../../shared/guide/try_out_guide_dialog.dart';

/// Desktop layout for the [CaesarTryOut] page
class CaesarTryOutDesktop extends StatefulWidget {
  final String resultValue;
  final String textValue;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String> onKeyChanged;
  final VoidCallback onSwapPressed;
  final ValueChanged<double> onSliderChanged;


  const CaesarTryOutDesktop({
    super.key,
    required this.resultValue,
    required this.textValue,
    required this.onTextChanged,
    required this.onKeyChanged,
    required this.onSwapPressed,
    required this.onSliderChanged,
  });

  @override
  State<CaesarTryOutDesktop> createState() => _CaesarTryOutDesktopState();
}

class _CaesarTryOutDesktopState extends State<CaesarTryOutDesktop> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showGuideIfNeeded();
    });
  }

  void _showGuideIfNeeded() {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;
    maybeShowTryOutGuide(
      context: context,
      featureKey: 'caesar',
      steps: [
        GuideStep(
          title: l10n.caesarGuideStep1Title,
          message: l10n.caesarGuideStep1Message,
          icon: Icons.auto_awesome,
        ),
        GuideStep(
          title: l10n.caesarGuideStep2Title,
          message: l10n.caesarGuideStep2Message,
          icon: Icons.tune,
        ),
        GuideStep(
          title: l10n.caesarGuideStep3Title,
          message: l10n.caesarGuideStep3Message,
          icon: Icons.keyboard,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<CaesarController>(builder: (context, controller, child) {
      final isEncrypting = controller.isEncrypting;
      final shiftValue = controller.key;

      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SharedHeader(
                title: l10n.caesar,
                description: l10n.caesarCipherDescription,
                onAboutPressed: () {
                  CaesarNavigationService.instance.navigatorKey.currentState
                      ?.pushNamed(AppRoutes.about);
                },
                onHelpPressed: () {
                  showTryOutGuideDialog(
                    context: context,
                    featureKey: 'caesar',
                    steps: [
                      GuideStep(
                        title: l10n.caesarGuideStep1Title,
                        message: l10n.caesarGuideStep1Message,
                        icon: Icons.auto_awesome,
                      ),
                      GuideStep(
                        title: l10n.caesarGuideStep2Title,
                        message: l10n.caesarGuideStep2Message,
                        icon: Icons.tune,
                      ),
                      GuideStep(
                        title: l10n.caesarGuideStep3Title,
                        message: l10n.caesarGuideStep3Message,
                        icon: Icons.keyboard,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),

              // Shift Control & Formula
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // shift control
                    Expanded(
                      flex: 2,
                      child: ShiftControl(
                          onKeyChanged: widget.onKeyChanged,
                      ),
                    ),
                    const SizedBox(width: 24),

                    // formula
                    Expanded(
                        flex: 1,
                        child: FormulaContainer(isEncrypting: isEncrypting)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              CaesarAlphabetViz(shift: isEncrypting ? shiftValue : -shiftValue),
              const SizedBox(height: 32),

              // Inputs
              Row(
                children: [
                  Expanded(
                    child: InputSection.input(
                      onTextChanged: widget.onTextChanged,
                      isEncrypting: isEncrypting,
                      resultValue: widget.resultValue,
                      textValue: widget.textValue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          l10n.swap,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkOnSurface,
                          )
                        ),
                        IconButton(
                          onPressed: widget.onSwapPressed,
                          icon: const Icon(Icons.swap_horiz, size: 32, color: AppColors.darkPrimary),
                          tooltip: l10n.tooltipCaesarSwap,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: InputSection.result(
                      onTextChanged: widget.onTextChanged,
                      isEncrypting: isEncrypting,
                      resultValue: widget.resultValue,
                      textValue: widget.textValue,
                    ),
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

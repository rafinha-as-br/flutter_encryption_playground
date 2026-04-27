import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/theme/app_colors.dart';
import '../../../../../shared/widgets/default_container.dart';
import '../../../../../shared/widgets/shared_header.dart';
import '../../caesar_controller.dart';
import '../../widgets/caesar_alphabet_viz.dart';
import '../caesar_tab.dart';

class CaesarTryOutDesktop extends StatelessWidget {
  final TextEditingController textController;
  final TextEditingController keyController;
  final TextEditingController resultController;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String> onKeyChanged;
  final VoidCallback onSwapPressed;
  final ValueChanged<double> onSliderChanged;


  const CaesarTryOutDesktop({
    super.key,
    required this.textController,
    required this.keyController,
    required this.resultController,
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
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // shift control
                    Expanded(
                      flex: 2,
                      child: DefaultContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shift Control',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkOnSurface,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Slider(
                                      value: shiftValue.toDouble().clamp(-26.0, 26.0),
                                      min: -26,
                                      max: 26,
                                      divisions: 52,
                                      label: shiftValue.toString(),
                                      activeColor: AppColors.darkPrimary,
                                      onChanged: onSliderChanged,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      controller: keyController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
                                      ],
                                      onChanged: onKeyChanged,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                    const SizedBox(width: 24),

                    // formula
                    Expanded(
                        flex: 1,
                        child: DefaultContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Formula',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkOnSurface,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  isEncrypting
                                      ? 'E_n(x) = (x + n) mod 26'
                                      : 'D_n(x) = (x - n) mod 26',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 16,
                                    color: AppColors.darkPrimary,
                                  ),
                                ),
                              ],
                            )
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              CaesarAlphabetViz(shift: isEncrypting ? shiftValue : -shiftValue),
              const SizedBox(height: 32),

              // Inputs
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildInputSection(isEncrypting, true)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                          child: IconButton(
                            onPressed: onSwapPressed,
                            icon: const Icon(Icons.swap_horiz, size: 32, color: AppColors.darkPrimary),
                          ),
                        ),
                        Expanded(child: _buildInputSection(isEncrypting, false)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildInputSection(isEncrypting, true),
                        const SizedBox(height: 16),
                        IconButton(
                          onPressed: onSwapPressed,
                          icon: const Icon(Icons.swap_vert, size: 32, color: AppColors.darkPrimary),
                        ),
                        const SizedBox(height: 16),
                        _buildInputSection(isEncrypting, false),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
  Widget _buildInputSection(bool isEncrypting, bool isInput) {
    final title = isInput
        ? (isEncrypting ? 'Plaintext' : 'Ciphertext')
        : (isEncrypting ? 'Ciphertext' : 'Plaintext');
    final controller = isInput ? textController : resultController;

    return DefaultContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.darkOnSurface,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 5,
              readOnly: !isInput,
              onChanged: isInput ? onTextChanged : null,
              decoration: InputDecoration(
                  hintText: isInput ? 'Enter text here...' : 'Result will appear here...',
                  fillColor: Colors.black
              ),
            ),
          ],
        )
    );
  }

}

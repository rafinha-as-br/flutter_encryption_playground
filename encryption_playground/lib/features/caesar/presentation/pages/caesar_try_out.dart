import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/shared_header.dart';
import '../../../../app/app_routes.dart';
import '../caesar_controller.dart';
import '../widgets/caesar_alphabet_viz.dart';
import 'caesar_tab.dart'; // Provides CaesarNavigationService

class CaesarTryOutScreen extends StatefulWidget {
  const CaesarTryOutScreen({super.key});

  @override
  State<CaesarTryOutScreen> createState() => _CaesarTryOutScreenState();
}

class _CaesarTryOutScreenState extends State<CaesarTryOutScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = Provider.of<CaesarController>(context, listen: false);
    if (controller.key != null && _keyController.text.isEmpty) {
      _keyController.text = controller.key.toString();
    } else if (controller.key == null) {
      controller.key = 3;
      _keyController.text = '3';
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _keyController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    setState(() {});
    _processText();
  }

  void _onKeyChanged(String value) {
    final controller = Provider.of<CaesarController>(context, listen: false);
    int? parsed = int.tryParse(value);
    if (parsed != null) {
      controller.key = parsed;
      _processText();
    }
    setState(() {});
  }

  void _onSliderChanged(double value) {
    _keyController.text = value.toInt().toString();
    _onKeyChanged(_keyController.text);
  }

  void _onSwapPressed() {
    final controller = Provider.of<CaesarController>(context, listen: false);
    controller.isEncrypting = !controller.isEncrypting;
    setState(() {
      final temp = _textController.text;
      _textController.text = _resultController.text;
      _resultController.text = temp;
    });
    _processText();
  }

  void _processText() {
    final controller = Provider.of<CaesarController>(context, listen: false);
    if (controller.key == null || _textController.text.isEmpty) {
      _resultController.text = '';
      return;
    }
    if (controller.isEncrypting) {
      _resultController.text = controller.encrypt(_textController.text);
    } else {
      _resultController.text = controller.decrypt(_textController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
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
                                  onChanged: _onSliderChanged,
                                ),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  controller: _keyController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
                                  ],
                                  onChanged: _onKeyChanged,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: Container(
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
                      ),
                    ),
                  ),
                ],
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
                            onPressed: _onSwapPressed,
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
                          onPressed: _onSwapPressed,
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
    final controller = isInput ? _textController : _resultController;
    
    return Column(
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
          onChanged: isInput ? _onTextChanged : null,
          decoration: InputDecoration(
            hintText: isInput ? 'Enter text here...' : 'Result will appear here...',
          ),
        ),
      ],
    );
  }
}

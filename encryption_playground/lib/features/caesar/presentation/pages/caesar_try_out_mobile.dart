import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_routes.dart';
import '../../../../l10n/app_localizations.dart';
import '../caesar_controller.dart';
import 'caesar_tab.dart';

class CaesarTryOutMobile extends StatelessWidget {
  final TextEditingController textController;
  final TextEditingController keyController;
  final TextEditingController resultController;
  final ValueChanged<String> onTextChanged;
  final ValueChanged<String> onKeyChanged;
  final VoidCallback onSwapPressed;

  const CaesarTryOutMobile({
    super.key,
    required this.textController,
    required this.keyController,
    required this.resultController,
    required this.onTextChanged,
    required this.onKeyChanged,
    required this.onSwapPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<CaesarController>(builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.caesarTryOut),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                CaesarNavigationService.instance.navigatorKey.currentState
                    ?.pushNamed(AppRoutes.about);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Column(
            children: [
              TextField(
                controller: textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                onChanged: onTextChanged,
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? l10n.enterTextToEncrypt
                      : l10n.enterTextToDecrypt,
                  errorText: textController.text.isNotEmpty &&
                          !RegExp(r'^[a-zA-Z\s]*$').hasMatch(textController.text)
                      ? l10n.lettersOnly
                      : null,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: keyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: onKeyChanged,
                      decoration: InputDecoration(
                        hintText: l10n.enterKey,
                        errorText: keyController.text.isNotEmpty &&
                                int.tryParse(keyController.text) == null
                            ? l10n.numbersOnly
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                      onPressed: onSwapPressed,
                      icon: const Icon(Icons.swap_vert)),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: resultController,
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? l10n.encryptedText
                      : l10n.decryptedText,
                ),
                enabled: false,
              ),
            ],
          ),
        ),
      );
    });
  }
}

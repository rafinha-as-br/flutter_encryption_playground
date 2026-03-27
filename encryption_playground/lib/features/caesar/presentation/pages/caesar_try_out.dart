import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_routes.dart';
import '../../../../l10n/app_localizations.dart';
import '../caesar_controller.dart';
import 'caesar_tab.dart';

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
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _keyController.dispose();
    _resultController.dispose();
    super.dispose();
  }

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
                controller: _textController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                onChanged: (value) {
                  setState(() {});
                  if (controller.key == null) return;
                  if (controller.isEncrypting) {
                    _resultController.text = controller.encrypt(value);
                  } else {
                    _resultController.text = controller.decrypt(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? l10n.enterTextToEncrypt
                      : l10n.enterTextToDecrypt,
                  errorText: _textController.text.isNotEmpty &&
                          !RegExp(r'^[a-zA-Z\s]*$').hasMatch(_textController.text)
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
                    child: TextField(
                      controller: _keyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        setState(() {});
                        controller.key = int.tryParse(value);
                        if (controller.key != null) {
                          if (controller.isEncrypting) {
                            _resultController.text =
                                controller.encrypt(_textController.text);
                          } else {
                            _resultController.text =
                                controller.decrypt(_textController.text);
                          }
                        }
                      },
                      decoration: InputDecoration(
                        hintText: l10n.enterKey,
                        errorText: _keyController.text.isNotEmpty &&
                                int.tryParse(_keyController.text) == null
                            ? l10n.numbersOnly
                            : null,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.isEncrypting = !controller.isEncrypting;
                        setState(() {
                          _textController.text = '';
                          _resultController.text = '';
                        });
                      },
                      icon: const Icon(Icons.swap_vert)),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _resultController,
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? l10n.encryptedText
                      : l10n.decryptedText,
                ),
                enabled: false,
              )
            ],
          ),
        ),
      );
    });
  }
}

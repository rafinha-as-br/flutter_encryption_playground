import 'package:encryption_playground/features/caesar/presentation/ceasar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ceasar_tab.dart';

class CeasarTryOutScreen extends StatefulWidget {
  const CeasarTryOutScreen({super.key});

  @override
  State<CeasarTryOutScreen> createState() => _CeasarTryOutScreenState();
}

class _CeasarTryOutScreenState extends State<CeasarTryOutScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = Provider.of<CeasarController>(context, listen: false);
    if (controller.key != null && _keyController.text.isEmpty) {
      _keyController.text = controller.key.toString();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CeasarController>(builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Caesar Try Out'),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                CaesarNavigationService.instance.navigatorKey.currentState
                    ?.pushNamed('about');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Column(
            spacing: 12,
            children: [
              TextField(
                controller: _textController,
                onChanged: (value) {
                  if (controller.key == null) return;
                  if (controller.isEncrypting) {
                    _resultController.text = controller.encrypt(value);
                  } else {
                    _resultController.text = controller.decrypt(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? 'Enter text to encrypt'
                      : 'Enter text to decrypt',
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 12,
                children: [
                  Spacer(),

                  Expanded(
                    child: TextField(
                      controller: _keyController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.key = int.tryParse(value);
                        if(controller.key != null){
                          if (controller.isEncrypting) {
                            _resultController.text = controller.encrypt(_textController.text);
                          } else{
                            _resultController.text = controller.decrypt(_textController.text);
                          }
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter key',

                      ),
                      textAlign: TextAlign.center,
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

                  Spacer(),
                ],
              ),

              TextField(
                controller: _resultController,
                decoration: InputDecoration(
                  hintText: controller.isEncrypting
                      ? 'Encrypted text'
                      : 'Decrypted text',
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

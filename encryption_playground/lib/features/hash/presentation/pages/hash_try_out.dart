import 'package:encryption_playground/features/hash/presentation/hash_controller.dart';
import 'package:encryption_playground/features/hash/presentation/pages/hash_tab.dart';
import 'package:encryption_playground/features/hash/presentation/widgets/hash_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_routes.dart';
import '../../../../l10n/app_localizations.dart';

class HashTryOut extends StatefulWidget {
  const HashTryOut({super.key});

  @override
  State<HashTryOut> createState() => _HashTryOutState();
}

class _HashTryOutState extends State<HashTryOut> {
  final TextEditingController _textAController = TextEditingController();
  final TextEditingController _textBController = TextEditingController();

  final TextEditingController _dartAController = TextEditingController();
  final TextEditingController _dartBController = TextEditingController();

  final TextEditingController _sha1AController = TextEditingController();
  final TextEditingController _sha1BController = TextEditingController();

  final TextEditingController _sha256AController = TextEditingController();
  final TextEditingController _sha256BController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<HashController>(builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.hashCodeTryOut),
          actions: [
            IconButton(
                onPressed: () {
                HashNavigationService.instance.navigatorKey.currentState!.pushNamed(AppRoutes.about);
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),


            /* todo: Change the column to Row when it's desktop/web version */
            child: Column(
              spacing: 15,
              children: [
                HashCard(
                    title: l10n.inputA,
                    textController: _textAController,
                    dartController: _dartAController,
                    sha1Controller: _sha1AController,
                    sha256Controller: _sha256AController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _textBController.text = value;

                        _dartAController.text = controller.generateDartHascode(value);
                        _dartBController.text = controller.generateDartHascode(value);

                        _sha1AController.text = controller.generateSha1Hascode(value);
                        _sha1BController.text = controller.generateSha1Hascode(value);

                        _sha256AController.text = controller.generateSha256Hascode(value);
                        _sha256BController.text = controller.generateSha256Hascode(value);
                      }
                    }),
                HashCard(
                    title: l10n.inputB,
                    textController: _textBController,
                    dartController: _dartBController,
                    sha1Controller: _sha1BController,
                    sha256Controller: _sha256BController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _dartBController.text = controller.generateDartHascode(value);
                        _sha1BController.text = controller.generateSha1Hascode(value);
                        _sha256BController.text = controller.generateSha256Hascode(value);
                      }
                    }),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_routes.dart';
import '../../../../app/app_layout_config.dart';
import '../../../../l10n/app_localizations.dart';
import '../hash_controller.dart';
import '../widgets/hash_card.dart';
import 'hash_tab.dart';

class HashTryOutDesktop extends StatelessWidget {
  final TextEditingController textAController;
  final TextEditingController textBController;
  final TextEditingController dartAController;
  final TextEditingController dartBController;
  final TextEditingController sha1AController;
  final TextEditingController sha1BController;
  final TextEditingController sha256AController;
  final TextEditingController sha256BController;

  const HashTryOutDesktop({
    super.key,
    required this.textAController,
    required this.textBController,
    required this.dartAController,
    required this.dartBController,
    required this.sha1AController,
    required this.sha1BController,
    required this.sha256AController,
    required this.sha256BController,
  });

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
                  HashNavigationService.instance.navigatorKey.currentState!
                      .pushNamed(AppRoutes.about);
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: LayoutConfig.maxContentWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: HashCard(
                          title: l10n.inputA,
                          textController: textAController,
                          dartController: dartAController,
                          sha1Controller: sha1AController,
                          sha256Controller: sha256AController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              textBController.text = value;

                              dartAController.text = controller.generateDartHascode(value);
                              dartBController.text = controller.generateDartHascode(value);

                              sha1AController.text = controller.generateSha1Hascode(value);
                              sha1BController.text = controller.generateSha1Hascode(value);

                              sha256AController.text = controller.generateSha256Hascode(value);
                              sha256BController.text = controller.generateSha256Hascode(value);
                            }
                          }),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: HashCard(
                          title: l10n.inputB,
                          textController: textBController,
                          dartController: dartBController,
                          sha1Controller: sha1BController,
                          sha256Controller: sha256BController,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              dartBController.text = controller.generateDartHascode(value);
                              sha1BController.text = controller.generateSha1Hascode(value);
                              sha256BController.text = controller.generateSha256Hascode(value);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

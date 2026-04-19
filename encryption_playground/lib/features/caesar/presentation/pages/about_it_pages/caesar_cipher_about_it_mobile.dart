import 'package:encryption_playground/shared/widgets/about_pages_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';
import '../caesar_tab.dart';

class CaesarCipherAboutItMobile extends StatelessWidget {
  const CaesarCipherAboutItMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutCaesarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            CaesarNavigationService.instance.navigatorKey.currentState?.pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BuildSection(
            title: l10n.whatIsCaesarTitle,
            content: l10n.whatIsCaesarContent,
          ),
          const SizedBox(height: 24),
          BuildSection(
            title: l10n.originCaesarTitle,
            content: l10n.originCaesarContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.howItWorksCaesarTitle,
            content: l10n.howItWorksCaesarContent,
          ),
          BuildCodeBlock(
            code: 'E(x) = (x + k) mod 26\nD(x) = (x - k) mod 26',
          ),
          const Divider(),
          BuildSection(
            title: l10n.characteristicsCaesarTitle,
            content: l10n.characteristicsCaesarContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.usageHistoryCaesarTitle,
            content: l10n.usageHistoryCaesarContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.limitationsCaesarTitle,
            content: l10n.limitationsCaesarContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.currentUsageCaesarTitle,
            content: l10n.currentUsageCaesarContent,
          ),
        ],
      ),
    );
  }
  
}

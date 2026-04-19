import 'package:flutter/material.dart';
import 'package:encryption_playground/shared/widgets/about_pages_widgets.dart';
import '../../../../../l10n/app_localizations.dart';

class DiffieHellmanAboutItDesktop extends StatelessWidget {
  const DiffieHellmanAboutItDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutDiffieHellmanTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BuildSection(
            title: l10n.whatIsDiffieHellmanTitle,
            content: l10n.whatIsDiffieHellmanContent,
          ),
          const SizedBox(height: 24),
          BuildSection(
            title: l10n.originDiffieHellmanTitle,
            content: l10n.originDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.ideaDiffieHellmanTitle,
            content: l10n.ideaDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.howItWorksDiffieHellmanTitle,
            content: l10n.howItWorksDiffieHellmanContent,
          ),
          BuildCodeBlock(
            code: 'A = g^a mod p\nB = g^b mod p',
          ),
          BuildSection(
            title: '',
            content: l10n.step45DiffieHellmanContent,
          ),
          BuildCodeBlock(
            code: 'chave = B^a mod p = A^b mod p',
          ),
          const Divider(),
          BuildSection(
            title: l10n.mathConceptDiffieHellmanTitle,
            content: l10n.mathConceptDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.characteristicsDiffieHellmanTitle,
            content: l10n.characteristicsDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.usageHistoryDiffieHellmanTitle,
            content: l10n.usageHistoryDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.currentUsageDiffieHellmanTitle,
            content: l10n.currentUsageDiffieHellmanContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.limitationsDiffieHellmanTitle,
            content: l10n.limitationsDiffieHellmanContent,
          ),
        ],
      ),
    );
  }


}

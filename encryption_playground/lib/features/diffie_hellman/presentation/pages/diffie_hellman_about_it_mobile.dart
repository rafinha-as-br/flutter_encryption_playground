import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class DiffieHellmanAboutItMobile extends StatelessWidget {
  const DiffieHellmanAboutItMobile({super.key});

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
          _buildSection(
            context,
            title: l10n.whatIsDiffieHellmanTitle,
            content: l10n.whatIsDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.originDiffieHellmanTitle,
            content: l10n.originDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.ideaDiffieHellmanTitle,
            content: l10n.ideaDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.howItWorksDiffieHellmanTitle,
            content: l10n.howItWorksDiffieHellmanContent,
          ),
          _buildCodeBlock(
            context,
            'A = g^a mod p\nB = g^b mod p',
          ),
          _buildSection(
            context,
            title: '',
            content: l10n.step45DiffieHellmanContent,
          ),
          _buildCodeBlock(
            context,
            'chave = B^a mod p = A^b mod p',
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.mathConceptDiffieHellmanTitle,
            content: l10n.mathConceptDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.characteristicsDiffieHellmanTitle,
            content: l10n.characteristicsDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.usageHistoryDiffieHellmanTitle,
            content: l10n.usageHistoryDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.currentUsageDiffieHellmanTitle,
            content: l10n.currentUsageDiffieHellmanContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.limitationsDiffieHellmanTitle,
            content: l10n.limitationsDiffieHellmanContent,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          if (title.isNotEmpty) const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(BuildContext context, String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }
}

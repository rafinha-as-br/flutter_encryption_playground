import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class HashAboutItDesktop extends StatelessWidget {
  const HashAboutItDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutHashTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            context,
            title: l10n.whatIsHashTitle,
            content: l10n.whatIsHashContent,
          ),
          _buildCodeBlock(
            context,
            '"senha123" → a94a8fe5ccb19ba61c4c0873d391e987...',
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.originHashTitle,
            content: l10n.originHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.howItWorksHashTitle,
            content: l10n.howItWorksHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.importantPropertiesHashTitle,
            content: l10n.importantPropertiesHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.characteristicsHashTitle,
            content: l10n.characteristicsHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.usageHistoryHashTitle,
            content: l10n.usageHistoryHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.currentUsageHashTitle,
            content: l10n.currentUsageHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.limitationsHashTitle,
            content: l10n.limitationsHashContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.importantObservationHashTitle,
            content: l10n.importantObservationHashContent,
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
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
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

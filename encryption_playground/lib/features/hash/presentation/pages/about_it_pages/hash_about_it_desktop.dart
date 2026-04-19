import 'package:flutter/material.dart';
import 'package:encryption_playground/shared/widgets/about_pages_widgets.dart';
import '../../../../../../l10n/app_localizations.dart';

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
          BuildSection(
            title: l10n.whatIsHashTitle,
            content: l10n.whatIsHashContent,
          ),
          BuildCodeBlock(
            code: '"senha123" → a94a8fe5ccb19ba61c4c0873d391e987...',
          ),
          const SizedBox(height: 24),
          BuildSection(
            title: l10n.originHashTitle,
            content: l10n.originHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.howItWorksHashTitle,
            content: l10n.howItWorksHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.importantPropertiesHashTitle,
            content: l10n.importantPropertiesHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.characteristicsHashTitle,
            content: l10n.characteristicsHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.usageHistoryHashTitle,
            content: l10n.usageHistoryHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.currentUsageHashTitle,
            content: l10n.currentUsageHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.limitationsHashTitle,
            content: l10n.limitationsHashContent,
          ),
          const Divider(),
          BuildSection(
            title: l10n.importantObservationHashTitle,
            content: l10n.importantObservationHashContent,
          ),
        ],
      ),
    );
  }


}

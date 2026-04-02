import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import 'caesar_tab.dart';

class CaesarCipherAboutItDesktop extends StatelessWidget {
  const CaesarCipherAboutItDesktop({super.key});

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
          _buildSection(
            context,
            title: l10n.whatIsCaesarTitle,
            content: l10n.whatIsCaesarContent,
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            title: l10n.originCaesarTitle,
            content: l10n.originCaesarContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.howItWorksCaesarTitle,
            content: l10n.howItWorksCaesarContent,
          ),
          _buildCodeBlock(
            context,
            'E(x) = (x + k) mod 26\nD(x) = (x - k) mod 26',
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.characteristicsCaesarTitle,
            content: l10n.characteristicsCaesarContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.usageHistoryCaesarTitle,
            content: l10n.usageHistoryCaesarContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.limitationsCaesarTitle,
            content: l10n.limitationsCaesarContent,
          ),
          const Divider(),
          _buildSection(
            context,
            title: l10n.currentUsageCaesarTitle,
            content: l10n.currentUsageCaesarContent,
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
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant.withAlpha(38),
        ),
      ),
      child: Text(
        code,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/theme/app_colors.dart';
import 'hash_info_dialog.dart';

class HashCard extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final TextEditingController dartController;
  final TextEditingController sha1Controller;
  final TextEditingController sha256Controller;
  final void Function(String)? onChanged;

  const HashCard({
    super.key,
    required this.title,
    required this.textController,
    required this.dartController,
    required this.sha1Controller,
    required this.sha256Controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(38), // ~15% opacity ghost border
        ),
        boxShadow: isDark
            ? [
                const BoxShadow(
                  color: AppColors.cyanGlow,
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          spacing: 12,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),

            /// input text field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    onChanged: onChanged,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: l10n.enterText,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      showHashInfoDialog(context: context, type: HashType.input),
                  icon: const Icon(Icons.question_mark, size: 18),
                )
              ],
            ),

            /// Separator via background color shift
            const SizedBox(height: 4),

            /// Dart hashcode
            _buildHashOutput(
              context: context,
              controller: dartController,
              hintText: l10n.dartHashCode,
              hashType: HashType.dart,
            ),

            /// sha-1 hashcode
            _buildHashOutput(
              context: context,
              controller: sha1Controller,
              hintText: l10n.sha1HashCode,
              hashType: HashType.sha1,
            ),

            /// sha256 hashcode
            _buildHashOutput(
              context: context,
              controller: sha256Controller,
              hintText: l10n.sha256HashCode,
              hashType: HashType.sha256,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHashOutput({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required HashType hashType,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withAlpha(180),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: theme.colorScheme.surfaceContainerHigh,
            ),
            enabled: false,
          ),
        ),
        IconButton(
          onPressed: () =>
              showHashInfoDialog(context: context, type: hashType),
          icon: const Icon(Icons.question_mark, size: 18),
        )
      ],
    );
  }
}

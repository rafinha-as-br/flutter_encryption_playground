import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

enum HashType {
  dart,
  sha1,
  sha256,
  input
}

class HashInfo {
  final String title;
  final String description;

  const HashInfo({
    required this.title,
    required this.description,
  });
}

HashInfo getHashInfo(BuildContext context, HashType type) {
  final l10n = AppLocalizations.of(context)!;
  switch (type) {
    case HashType.dart:
      return HashInfo(
        title: l10n.dartHashCodeTitle,
        description: l10n.dartHashCodeDescription,
      );
    case HashType.sha1:
      return HashInfo(
        title: l10n.sha1HashCodeTitle,
        description: l10n.sha1HashCodeDescription,
      );
    case HashType.sha256:
      return HashInfo(
        title: l10n.sha256HashCodeTitle,
        description: l10n.sha256HashCodeDescription,
      );
    case HashType.input:
      return HashInfo(
        title: l10n.inputTextTitle,
        description: l10n.inputTextDescription,
      );
  }
}

Future<void> showHashInfoDialog({
  required BuildContext context,
  required HashType type,
}) {
  final info = getHashInfo(context, type);
  final l10n = AppLocalizations.of(context)!;
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return showDialog(
    context: context,
    builder: (dialogContext) {
      return BackdropFilter(
        filter: isDark
            ? ImageFilter.blur(sigmaX: 12, sigmaY: 12)
            : ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: isDark
                ? BorderSide(
                    color: theme.colorScheme.primary.withAlpha(51), // 20% opacity
                    width: 0.5,
                  )
                : BorderSide.none,
          ),
          backgroundColor: isDark
              ? theme.colorScheme.surfaceContainerHighest.withAlpha(200) // ~78% opacity for glass
              : theme.colorScheme.surfaceContainerHigh,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        info.title,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  info.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(l10n.close),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

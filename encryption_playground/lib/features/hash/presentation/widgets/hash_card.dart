import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withAlpha(50),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          spacing: 9,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            /// input text field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: l10n.enterText,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => showHashInfoDialog(context: context, type: HashType.input),
                  icon: const Icon(Icons.question_mark),
                )
              ],
            ),

            Divider(
              color: Theme.of(context).colorScheme.outline,
              thickness: 1.5,
            ),

            /// Dart hashcode
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dartController,
                    decoration: InputDecoration(
                      hintText: l10n.dartHashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                  onPressed: () => showHashInfoDialog(context: context, type: HashType.dart),
                  icon: const Icon(Icons.question_mark),
                )
              ],
            ),

            /// sha-1 hashcode
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sha1Controller,
                    decoration: InputDecoration(
                      hintText: l10n.sha1HashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                  onPressed: () => showHashInfoDialog(context: context, type: HashType.sha1),
                  icon: const Icon(Icons.question_mark),
                )
              ],
            ),

            /// sha256 hashcode
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sha256Controller,
                    decoration: InputDecoration(
                      hintText: l10n.sha256HashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                  onPressed: () => showHashInfoDialog(context: context, type: HashType.sha256),
                  icon: const Icon(Icons.question_mark),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

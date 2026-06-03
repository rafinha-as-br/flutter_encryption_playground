import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../l10n/app_localizations.dart';

/// Widget for displaying the difference between two texts.
class HashDiffText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isHighlighting;

  const HashDiffText({
    super.key,
    required this.text1,
    required this.text2,
    this.isHighlighting = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (!isHighlighting || text1.isEmpty || text2.isEmpty || text1 == text2) {
      return Text(
        text1.isEmpty ? AppLocalizations.of(context)!.waitingForInput : text1,
        style: GoogleFonts.jetBrainsMono(
          color: text1.isEmpty ? colorScheme.onSurfaceVariant : colorScheme.primary,
          fontSize: 14,
        ),
      );
    }

    final maxLength = text1.length > text2.length ? text1.length : text2.length;
    List<TextSpan> spans = [];

    for (int i = 0; i < maxLength; i++) {
      String char1 = i < text1.length ? text1[i] : '';
      String char2 = i < text2.length ? text2[i] : '';
      
      bool isMatch = char1 == char2;
      
      spans.add(TextSpan(
        text: char1,
        style: GoogleFonts.jetBrainsMono(
          color: isMatch ? colorScheme.primary : colorScheme.error,
          fontWeight: isMatch ? FontWeight.w500 : FontWeight.w700,
          backgroundColor: isMatch ? Colors.transparent : colorScheme.error.withAlpha(25),
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}

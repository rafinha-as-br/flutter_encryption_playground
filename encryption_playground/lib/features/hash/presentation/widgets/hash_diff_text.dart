import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';

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
    if (!isHighlighting || text1.isEmpty || text2.isEmpty || text1 == text2) {
      return Text(
        text1.isEmpty ? 'Waiting for input...' : text1,
        style: GoogleFonts.jetBrainsMono(
          color: text1.isEmpty ? AppColors.darkOnSurfaceVariant : AppColors.darkPrimary,
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
          color: isMatch ? AppColors.darkPrimary : AppColors.darkError,
          fontWeight: isMatch ? FontWeight.w500 : FontWeight.w700,
          backgroundColor: isMatch ? Colors.transparent : AppColors.darkError.withAlpha(25),
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}

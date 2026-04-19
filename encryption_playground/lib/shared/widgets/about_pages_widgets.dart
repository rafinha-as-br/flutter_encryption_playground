import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSection extends StatelessWidget {
  const BuildSection({
    super.key,
    required this.title,
    required this.content
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
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
}

class BuildCodeBlock extends StatelessWidget {
  const BuildCodeBlock({super.key, required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
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

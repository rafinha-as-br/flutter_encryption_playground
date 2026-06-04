
import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: child
    );
  }
}

import 'package:flutter/material.dart';

class DiffieHellmanSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final IconData icon;

  const DiffieHellmanSectionCard({
    super.key,
    required this.title,
    required this.children,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12), // Increased from 2 for a more modern feel
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(38),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(theme),
          const SizedBox(height: 16),
          ...children.map((child) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: child,
              )),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: theme.colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

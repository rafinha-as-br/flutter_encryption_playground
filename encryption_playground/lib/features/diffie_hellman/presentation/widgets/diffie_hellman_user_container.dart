import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class DiffieHellmanUserContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DiffieHellmanUserContainer({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(38), // ~15% ghost border
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
      child: Column(
        children: [
          _buildTitle(theme),
          const SizedBox(height: 16),
          ...children.map((child) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: child,
              )),
        ],
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 48, color: theme.colorScheme.primary),
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

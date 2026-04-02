import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DiffieHellmanField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool enabled;
  final String hint;
  final IconData icon;
  final bool isPrimary;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;

  const DiffieHellmanField({
    super.key,
    required this.controller,
    this.onChanged,
    this.enabled = true,
    required this.hint,
    required this.icon,
    this.isPrimary = false,
    this.isSecret = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isPrimary
        ? theme.colorScheme.primary
        : (isSecret ? theme.colorScheme.tertiary : theme.colorScheme.secondary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            hint.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          style: GoogleFonts.jetBrainsMono(
            fontSize: isPrimary ? 15.0 : 14.0,
            fontWeight: isPrimary || isSecret ? FontWeight.bold : FontWeight.normal,
            color: enabled
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurface.withAlpha(70),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: color, size: 20),
            filled: true,
            fillColor: enabled
                ? theme.colorScheme.surfaceContainer
                : theme.colorScheme.surfaceContainerHigh,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
      ],
    );
  }
}

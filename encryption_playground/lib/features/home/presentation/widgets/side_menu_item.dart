import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCompact;

  const SideMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.isCompact = false,
  });

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final activeColor = colorScheme.primary;
    final inactiveColor = colorScheme.onSurfaceVariant;

    final color = widget.isSelected ? activeColor : inactiveColor;
    final bgColor = widget.isSelected
        ? colorScheme.primary.withAlpha(26)
        : (_isHovered ? colorScheme.onSurface.withAlpha(13) : Colors.transparent);

    final item = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(2),
            border: Border(
              left: BorderSide(
                color: widget.isSelected ? activeColor : inactiveColor,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: widget.isCompact
                ? Center(
                    child: Icon(widget.icon, color: color, size: 24),
                  )
                : Row(
                    children: [
                      Icon(widget.icon, color: color, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: GoogleFonts.spaceGrotesk(
                            color: color,
                            fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );

    if (widget.isCompact) {
      return Tooltip(
        message: widget.title,
        preferBelow: false,
        child: item,
      );
    }

    return item;
  }
}


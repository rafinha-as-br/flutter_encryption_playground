import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../shared/theme/app_colors.dart';

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
    final color = widget.isSelected
        ? AppColors.sideMenuTextActive
        : AppColors.sideMenuTextInactive;
    final bgColor = widget.isSelected
        ? AppColors.sideMenuActiveBackground
        : (_isHovered ? AppColors.sideMenuHoverBackground : Colors.transparent);

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
                color: widget.isSelected ? AppColors.sideMenuTextActive : AppColors.sideMenuTextInactive,
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

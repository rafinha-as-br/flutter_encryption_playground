import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../app/locale_controller.dart';
import '../../../../../app/theme_controller.dart';
import '../../../../../shared/theme/app_colors.dart';

class SideMenu extends StatelessWidget {
  final String currentRoute;
  final ValueChanged<String> onNavigate;

  const SideMenu({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sideMenuBackground,
      child: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset('assets/logo_full.png', height: 40),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _SideMenuItem(
                  title: 'Dashboard',
                  icon: Icons.dashboard_outlined,
                  isSelected: currentRoute == '/dashboard',
                  onTap: () => onNavigate('/dashboard'),
                ),
                const SizedBox(height: 8),
                _SideMenuItem(
                  title: 'Ciphers',
                  icon: Icons.security_outlined,
                  isSelected: currentRoute == '/ciphers',
                  onTap: () => onNavigate('/ciphers'),
                ),
                const SizedBox(height: 8),
                _SideMenuItem(
                  title: 'Symmetric',
                  icon: Icons.sync_alt_outlined,
                  isSelected: currentRoute == '/symmetric',
                  onTap: () => onNavigate('/symmetric'),
                ),
                const SizedBox(height: 8),
                _SideMenuItem(
                  title: 'Asymmetric',
                  icon: Icons.vpn_key_outlined,
                  isSelected: currentRoute == '/asymmetric',
                  onTap: () => onNavigate('/asymmetric'),
                ),
                const SizedBox(height: 8),
                _SideMenuItem(
                  title: 'Hash',
                  icon: Icons.fingerprint_outlined,
                  isSelected: currentRoute == '/hash',
                  onTap: () => onNavigate('/hash'),
                ),
              ],
            ),
          ),
          
          // Bottom section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    context.read<ThemeController>().toggleTheme();
                  },
                  icon: Icon(
                    context.watch<ThemeController>().isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                  label: const Text('Toggle Theme'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    context.read<LocaleController>().toggleLocale();
                  },
                  icon: const Icon(Icons.language),
                  label: Text(
                    context.watch<LocaleController>().value.languageCode == 'en'
                        ? 'English'
                        : 'Português',
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'v1.0.0',
                    style: GoogleFonts.spaceGrotesk(
                      color: AppColors.sideMenuTextInactive,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SideMenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SideMenuItem({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<_SideMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isSelected
        ? AppColors.sideMenuTextActive
        : AppColors.sideMenuTextInactive;
    final bgColor = widget.isSelected
        ? AppColors.sideMenuActiveBackground
        : (_isHovered ? AppColors.sideMenuHoverBackground : Colors.transparent);

    return MouseRegion(
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
                color: widget.isSelected ? AppColors.sideMenuTextActive : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(widget.icon, color: color, size: 20),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: GoogleFonts.spaceGrotesk(
                    color: color,
                    fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/locale_controller.dart';
import '../../../../../app/theme_controller.dart';
import '../../../../l10n/app_localizations.dart';
import '../pages/home_page.dart';
import 'side_menu_item.dart';

class SideMenuCompact extends StatelessWidget {
  const SideMenuCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: HomePageNavigationService.instance.routeTracker.currentRoute,
      builder: (context, currentRoute, child) {
        return Column(
          children: [
            // Logo (using an icon for compact mode instead of full image)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
              child:
              Provider.of<ThemeController>(context).isDarkMode ?
                Image.asset(
                  'assets/dark_logo_small.png', // Ideally this would be a smaller logo icon, but fallback to scaling
                  height: 32,
                  fit: BoxFit.contain,
                )
              :
                Image.asset(
                  'assets/light_logo_small.png', // Ideally this would be a smaller logo icon, but fallback to scaling
                  height: 32,
                  fit: BoxFit.contain,
                )

            ),

            // Buttons
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.dashboard,
                    icon: Icons.dashboard_outlined,
                    isSelected: currentRoute == '/dashboard',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/dashboard'),
                    isCompact: true,
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.cipherSuite,
                    icon: Icons.security_outlined,
                    isSelected: currentRoute == '/ciphers',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/ciphers'),
                    isCompact: true,
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.symmetricSuite,
                    icon: Icons.sync_alt_outlined,
                    isSelected: currentRoute == '/symmetric',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/symmetric'),
                    isCompact: true,
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.asymmetricSuite,
                    icon: Icons.vpn_key_outlined,
                    isSelected: currentRoute == '/asymmetric',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/asymmetric'),
                    isCompact: true,
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.hashSuite,
                    icon: Icons.fingerprint_outlined,
                    isSelected: currentRoute == '/hash',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/hash'),
                    isCompact: true,
                  ),
                ],
              ),
            ),

            // Bottom section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ThemeController>().toggleTheme();
                    },
                    icon: Icon(
                      context.watch<ThemeController>().isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    tooltip: AppLocalizations.of(context)!.theme,
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    onPressed: () {
                      context.read<LocaleController>().toggleLocale();
                    },
                    icon: const Icon(Icons.language),
                    tooltip: 'Change Language',
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

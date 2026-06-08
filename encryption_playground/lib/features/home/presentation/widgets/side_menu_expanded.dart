import 'package:encryption_playground/app/package_info_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../../app/locale_controller.dart';
import '../../../../../app/theme_controller.dart';
import '../../../../l10n/app_localizations.dart';
import '../pages/home_page.dart';
import 'side_menu_item.dart';

class SideMenuExpanded extends StatelessWidget {
  const SideMenuExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: HomePageNavigationService.instance.routeTracker.currentRoute,
      builder: (context, currentRoute, child) {
        final packageInfoService = PackageInfoService.instance;
        return Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Provider.of<ThemeController>(context).isDarkMode ?
              Image.asset(
                'assets/dark_logo_full.png',
                height: 150,
                fit: BoxFit.contain,
              )
                  :
              Image.asset(
                'assets/light_logo_full.png',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),

            // Buttons
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.dashboard,
                    icon: Icons.dashboard_outlined,
                    isSelected: currentRoute == '/dashboard',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/dashboard'),
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.cipherSuiteShortTitle,
                    icon: Icons.security_outlined,
                    isSelected: currentRoute == '/ciphers',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/ciphers'),
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.symmetricSuiteShortTitle,
                    icon: Icons.sync_alt_outlined,
                    isSelected: currentRoute == '/symmetric',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/symmetric'),
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.asymmetricSuiteShortTitle,
                    icon: Icons.vpn_key_outlined,
                    isSelected: currentRoute == '/asymmetric',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/asymmetric'),
                  ),
                  const SizedBox(height: 8),
                  SideMenuItem(
                    title: AppLocalizations.of(context)!.hashSuite,
                    icon: Icons.fingerprint_outlined,
                    isSelected: currentRoute == '/hash',
                    onTap: () => HomePageNavigationService.instance.navigatorKey.currentState?.pushReplacementNamed('/hash'),
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
                      Navigator.of(context, rootNavigator: true).pushNamed('/onboarding');
                    },
                    icon: const Icon(Icons.help_outline),
                    label: Text(AppLocalizations.of(context)!.reviewTutorial),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      context.read<ThemeController>().toggleTheme();
                    },
                    icon: Icon(
                      context.watch<ThemeController>().isDarkMode
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    label: Text(AppLocalizations.of(context)!.theme),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      context.read<LocaleController>().toggleLocale();
                    },
                    icon: const Icon(Icons.language),
                    label: Text(
                      context.watch<LocaleController>().value.languageCode == 'en'
                          ? 'Português'
                          : 'English',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      packageInfoService.packageInfo.version,
                      style: GoogleFonts.spaceGrotesk(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
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

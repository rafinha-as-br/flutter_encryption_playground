import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_routes.dart';
import '../../../../app/app_layout_config.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/diffie_hellman_global_parameters_section.dart';
import '../widgets/diffie_hellman_user_section.dart';
import 'diffie_hellman_tab.dart';
import '../diffie_hellman_controller.dart';

class DiffieHellmanTryOutDesktop extends StatelessWidget {
  const DiffieHellmanTryOutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.diffieHellmanTryOut,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.reset(),
            icon: const Icon(Icons.refresh),
            tooltip: l10n.reset,
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: () {
              DiffieHellmanNavigationService.instance.navigatorKey.currentState
                  ?.pushNamed(AppRoutes.about);
            },
            icon: const Icon(Icons.info_outline),
            label: Text(l10n.about),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: LayoutConfig.maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
              child: Column(
                children: [
                  /// users section
                  const DiffieHellmanUserSection(),

                  const SizedBox(height: 32),

                  /// global parameters centered and constrained
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: LayoutConfig.maxInputWidth),
                      child: const DiffieHellmanGlobalParametersSection(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

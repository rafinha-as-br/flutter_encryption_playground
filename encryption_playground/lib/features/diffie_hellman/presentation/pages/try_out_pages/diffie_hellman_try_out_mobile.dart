import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../widgets/diffie_hellman_global_parameters_section.dart';
import '../../widgets/diffie_hellman_user_section.dart';
import '../diffie_hellman_tab.dart';
import '../../diffie_hellman_controller.dart';

class DiffieHellmanTryOutMobile extends StatelessWidget {
  const DiffieHellmanTryOutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.diffieHellmanTryOut),
        actions: [
          IconButton(
            onPressed: () => controller.reset(),
            icon: const Icon(Icons.refresh),
            tooltip: l10n.reset,
          ),
          IconButton(
            onPressed: () {
              DiffieHellmanNavigationService.instance.navigatorKey.currentState?.pushNamed(AppRoutes.about);
            },
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// users section
              DiffieHellmanUserSection(),

              const SizedBox(height: 32),

              /// global parameters
              DiffieHellmanGlobalParametersSection(),

            ],
          ),
        ),
      ),
    );
  }
}

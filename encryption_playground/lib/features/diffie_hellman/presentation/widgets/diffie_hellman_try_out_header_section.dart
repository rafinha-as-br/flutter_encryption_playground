import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_routes.dart';
import '../../../../shared/widgets/shared_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../pages/diffie_hellman_tab.dart';

/// Responsible for displaying the header for the [DiffieHellmanTryOut] page.
class DHHeader extends StatelessWidget {
  final VoidCallback? onHelpPressed;

  const DHHeader({
    super.key,
    this.onHelpPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SharedHeader(
      title: l10n.diffieHellman,
      description: l10n.diffieHellmanDescription,
      onAboutPressed: () {
        DiffieHellmanNavigationService.instance.navigatorKey.currentState
            ?.pushNamed(AppRoutes.about);
      },
      onHelpPressed: onHelpPressed,
    );
  }
}

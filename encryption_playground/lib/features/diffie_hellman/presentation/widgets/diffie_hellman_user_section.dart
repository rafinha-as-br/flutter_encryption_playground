import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/responsive_layout_builder.dart';
import '../diffie_hellman_controller.dart';
import 'diffie_hellman_input.dart';
import 'diffie_hellman_section_card.dart';

class DiffieHellmanUserSection extends StatefulWidget {
  const DiffieHellmanUserSection({super.key});

  @override
  State<DiffieHellmanUserSection> createState() => _DiffieHellmanUserSectionState();
}

class _DiffieHellmanUserSectionState extends State<DiffieHellmanUserSection> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<DiffieHellmanController>();

    return ResponsiveLayoutBuilder(
      mobile: _buildLayout(context, controller, l10n, isMobile: true),
      tablet: _buildLayout(context, controller, l10n, isMobile: false),
      desktop: _buildLayout(context, controller, l10n, isMobile: false),
    );
  }

  Widget _buildLayout(
    BuildContext context,
    DiffieHellmanController controller,
    AppLocalizations l10n, {
    required bool isMobile,
  }) {
    final spacing = isMobile ? 16.0 : 32.0;

    final userAHint = isMobile
        ? "${l10n.privateKey} (a)"
        : "${l10n.privateKey} (a) - ${l10n.randomlyGenerated}";
    final userBHint = isMobile
        ? "${l10n.privateKey} (b)"
        : "${l10n.privateKey} (b) - ${l10n.randomlyGenerated}";

    final helperText = isMobile ? l10n.randomlyGenerated : null;

    final children = [
      /// user A
      Expanded(
        flex: isMobile ? 0 : 1,
        child: DiffieHellmanSectionCard(
          title: l10n.userA,
          children: [
            DiffieHellmanField(
              controller: controller.userAPrivateKeyController,
              enabled: false,
              hint: userAHint,
              helperText: helperText,
              icon: Icons.vpn_key_outlined,
            ),
            DiffieHellmanField(
              controller: controller.userAPublicKeyController,
              enabled: false,
              hint: "${l10n.publicKey} (A)",
              icon: Icons.public,
            ),
            DiffieHellmanField(
              controller: controller.sharedSecretAController,
              enabled: false,
              hint: l10n.sharedSecret,
              icon: Icons.lock_outline,
              isSecret: true,
            ),
          ],
        ),
      ),
      SizedBox(width: isMobile ? 0 : spacing, height: isMobile ? spacing : 0),

      /// user B
      Expanded(
        flex: isMobile ? 0 : 1,
        child: DiffieHellmanSectionCard(
          title: l10n.userB,
          children: [
            DiffieHellmanField(
              controller: controller.userBPrivateKeyController,
              enabled: false,
              hint: userBHint,
              helperText: helperText,
              icon: Icons.vpn_key_outlined,
            ),
            DiffieHellmanField(
              controller: controller.userBPublicKeyController,
              enabled: false,
              hint: "${l10n.publicKey} (B)",
              icon: Icons.public,
            ),
            DiffieHellmanField(
              controller: controller.sharedSecretBController,
              enabled: false,
              hint: l10n.sharedSecret,
              icon: Icons.lock_outline,
              isSecret: true,
            ),
          ],
        ),
      ),
    ];

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
  }
}

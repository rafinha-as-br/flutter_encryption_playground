import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../diffie_hellman_controller.dart';
import 'diffie_hellman_input.dart';
import 'diffie_hellman_user_container.dart';

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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// user A
        Expanded(
          child: DiffieHellmanUserContainer(
            title: l10n.userA,
            children: [
              DiffieHellmanField(
                controller: controller.userAPrivateKeyController,
                enabled: false,
                hint: "${l10n.privateKey} (a)",
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
        const SizedBox(width: 16),

        /// user B
        Expanded(
          child: DiffieHellmanUserContainer(
            title: l10n.userB,
            children: [
              DiffieHellmanField(
                controller: controller.userBPrivateKeyController,
                enabled: false,
                hint: "${l10n.privateKey} (b)",
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
      ],
    );
  }

}

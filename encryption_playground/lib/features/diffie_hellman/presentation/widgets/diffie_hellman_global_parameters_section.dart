import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../diffie_hellman_controller.dart';
import 'diffie_hellman_input.dart';
import 'diffie_hellman_section_card.dart';

class DiffieHellmanGlobalParametersSection extends StatefulWidget {
  const DiffieHellmanGlobalParametersSection({super.key});

  @override
  State<DiffieHellmanGlobalParametersSection> createState() => _DiffieHellmanGlobalParametersSectionState();
}

class _DiffieHellmanGlobalParametersSectionState extends State<DiffieHellmanGlobalParametersSection> {

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = context.watch<DiffieHellmanController>();

    return DiffieHellmanSectionCard(
      title: l10n.globalParameters,
      icon: Icons.settings,
      children: [
        DiffieHellmanField(
          controller: controller.gController,
          onChanged: (value) => controller.g = int.tryParse(value),
          hint: l10n.generator,
          icon: Icons.settings_input_component,
          isPrimary: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        DiffieHellmanField(
          controller: controller.pController,
          onChanged: (value) => controller.p = int.tryParse(value),
          hint: l10n.modulus,
          icon: Icons.numbers,
          isPrimary: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }
}

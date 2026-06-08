import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:encryption_playground/features/diffie_hellman/presentation/widgets/diffie_hellman_try_out_header_section.dart';
import 'package:flutter/material.dart';
import '../../widgets/diffie_hellman_global_parameters_section.dart';
import '../../widgets/diffie_hellman_try_out_key_computation_section.dart';
import '../../widgets/diffie_hellman_try_out_key_generation_section.dart';
import '../../../../../shared/guide/try_out_guide_dialog.dart';
import '../../../../../l10n/app_localizations.dart';

/// Desktop layout for the [DiffieHellmanTryOut] page
class DiffieHellmanTryOutDesktop extends StatefulWidget {
  const DiffieHellmanTryOutDesktop({super.key});

  @override
  State<DiffieHellmanTryOutDesktop> createState() => _DiffieHellmanTryOutDesktopState();
}

class _DiffieHellmanTryOutDesktopState extends State<DiffieHellmanTryOutDesktop> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showGuideIfNeeded();
    });
  }

  void _showGuideIfNeeded() {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;
    maybeShowTryOutGuide(
      context: context,
      featureKey: 'diffie_hellman',
      steps: [
        GuideStep(
          title: l10n.dhGuideStep1Title,
          message: l10n.dhGuideStep1Message,
          icon: Icons.auto_awesome,
        ),
        GuideStep(
          title: l10n.dhGuideStep2Title,
          message: l10n.dhGuideStep2Message,
          icon: Icons.settings,
        ),
        GuideStep(
          title: l10n.dhGuideStep3Title,
          message: l10n.dhGuideStep3Message,
          icon: Icons.vpn_key,
        ),
        GuideStep(
          title: l10n.dhGuideStep4Title,
          message: l10n.dhGuideStep4Message,
          icon: Icons.handshake,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            DHHeader(
              onHelpPressed: () {
                final l10n = AppLocalizations.of(context)!;
                showTryOutGuideDialog(
                  context: context,
                  featureKey: 'diffie_hellman',
                  steps: [
                    GuideStep(
                      title: l10n.dhGuideStep1Title,
                      message: l10n.dhGuideStep1Message,
                      icon: Icons.auto_awesome,
                    ),
                    GuideStep(
                      title: l10n.dhGuideStep2Title,
                      message: l10n.dhGuideStep2Message,
                      icon: Icons.settings,
                    ),
                    GuideStep(
                      title: l10n.dhGuideStep3Title,
                      message: l10n.dhGuideStep3Message,
                      icon: Icons.vpn_key,
                    ),
                    GuideStep(
                      title: l10n.dhGuideStep4Title,
                      message: l10n.dhGuideStep4Message,
                      icon: Icons.handshake,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // global parameters & key generation
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: 25,
                    children: [

                      // global parameters
                      DHGlobalParametersSection(),

                      // key generation
                      DHTryOutKeyGenerationSection(),

                    ],
                  ),
                ),

                SizedBox(width: 32),

                // key computation
                Expanded(
                  flex: 1,
                    child: DHTryOutKeyComputationSection()
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}



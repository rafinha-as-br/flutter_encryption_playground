import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/shared_header.dart';
import '../../../../app/app_routes.dart';
import 'diffie_hellman_tab.dart';
import '../diffie_hellman_controller.dart';

class DiffieHellmanTryOut extends StatelessWidget {
  const DiffieHellmanTryOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DHHeader(),
            SizedBox(height: 32),
            _DHGlobalParameters(),
            SizedBox(height: 32),
            _DHResponsiveLayout(),
          ],
        ),
      ),
    );
  }
}

class _DHHeader extends StatelessWidget {
  const _DHHeader();

  @override
  Widget build(BuildContext context) {
    return SharedHeader(
      title: 'Diffie-Hellman Key Exchange',
      description: 'A mathematical method of securely exchanging cryptographic keys over a public channel, establishing a shared secret that can be used for secret communications.',
      onAboutPressed: () {
        DiffieHellmanNavigationService.instance.navigatorKey.currentState
            ?.pushNamed(AppRoutes.about);
      },
    );
  }
}

class _DHGlobalParameters extends StatelessWidget {
  const _DHGlobalParameters();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. Global Parameters',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isSmall = constraints.maxWidth < 600;
              final children = [
                Expanded(
                  flex: isSmall ? 0 : 1,
                  child: _buildParameterInput(
                    controller.pController,
                    'Prime Modulus (P)',
                    'A large prime number (e.g. 23)',
                    (val) => controller.p = int.tryParse(val),
                  ),
                ),
                SizedBox(width: isSmall ? 0 : 24, height: isSmall ? 16 : 0),
                Expanded(
                  flex: isSmall ? 0 : 1,
                  child: _buildParameterInput(
                    controller.gController,
                    'Generator (G)',
                    'A primitive root modulo P (e.g. 5)',
                    (val) => controller.g = int.tryParse(val),
                  ),
                ),
              ];

              return isSmall
                  ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)
                  : Row(children: children);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildParameterInput(TextEditingController textController, String label, String hint, ValueChanged<String> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.darkOnSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: onChanged,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

class _DHResponsiveLayout extends StatelessWidget {
  const _DHResponsiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // Wide screen: Side by side
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _DHKeyGeneration()),
              SizedBox(width: 32),
              Expanded(child: _DHKeyComputation()),
            ],
          );
        } else {
          // Small screen: Stacked (Computation below Generation)
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DHKeyGeneration(),
              SizedBox(height: 32),
              _DHKeyComputation(),
            ],
          );
        }
      },
    );
  }
}

class _DHKeyGeneration extends StatelessWidget {
  const _DHKeyGeneration();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2. Key Generation',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 24),
          
          // User A
          _buildUserSection(
            'User A',
            controller.userAPrivateKeyController,
            controller.userAPublicKeyController,
            AppColors.darkPrimary,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Divider(color: AppColors.darkOutlineVariant),
          ),
          
          // User B
          _buildUserSection(
            'User B',
            controller.userBPrivateKeyController,
            controller.userBPublicKeyController,
            AppColors.darkSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildUserSection(String title, TextEditingController privateController, TextEditingController publicController, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person, color: accentColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: accentColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Private Key (a/b)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkOnSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: privateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Auto-generated',
                      prefixIcon: Icon(Icons.vpn_key_outlined, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Public Key (A/B)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkOnSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: publicController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Computed',
                      prefixIcon: Icon(Icons.public, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DHKeyComputation extends StatelessWidget {
  const _DHKeyComputation();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiffieHellmanController>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3. Key Computation',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkOnSurface,
            ),
          ),
          const SizedBox(height: 24),

          // User A Computation
          _buildComputationVisual(
            'User A computes shared key:',
            's = (B^a) mod P',
            controller.sharedSecretAController,
            AppColors.darkPrimary,
          ),
          const SizedBox(height: 24),
          
          // User B Computation
          _buildComputationVisual(
            'User B computes shared key:',
            's = (A^b) mod P',
            controller.sharedSecretBController,
            AppColors.darkSecondary,
          ),
          
          const SizedBox(height: 48),
          
          // Reset Button at the bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => controller.reset(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPrimary,
                foregroundColor: AppColors.darkSurface,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Parameters', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComputationVisual(String label, String formula, TextEditingController secretController, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainerHigh,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.darkOnSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formula,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: secretController,
            readOnly: true,
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: 'Shared Secret (s)',
              prefixIcon: Icon(Icons.lock_outline, color: accentColor, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

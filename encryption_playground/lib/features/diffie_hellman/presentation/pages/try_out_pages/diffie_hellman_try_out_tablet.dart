import 'package:encryption_playground/features/diffie_hellman/presentation/pages/diffie_hellman_try_out.dart';
import 'package:flutter/material.dart';
import '../../widgets/diffie_hellman_global_parameters_section.dart';
import '../../widgets/diffie_hellman_try_out_header_section.dart';
import '../../widgets/diffie_hellman_try_out_key_computation_section.dart';
import '../../widgets/diffie_hellman_try_out_key_generation_section.dart';

/// Tablet layout for the [DiffieHellmanTryOut] page
class DiffieHellmanTryOutTablet extends StatelessWidget {
  const DiffieHellmanTryOutTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          spacing: 32,
          children: [
            const DHHeader(),
            // global parameters
            DHGlobalParametersSection(),

            // key generation
            DHTryOutKeyGenerationSection(),

            // key computation
            DHTryOutKeyComputationSection()
          ],
        ),
      ),
    );
  }
}

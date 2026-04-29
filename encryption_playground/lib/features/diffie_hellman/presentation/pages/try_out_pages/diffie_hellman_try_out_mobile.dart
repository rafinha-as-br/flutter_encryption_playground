import 'package:flutter/material.dart';
import '../../widgets/diffie_hellman_global_parameters_section.dart';
import '../../widgets/diffie_hellman_try_out_header_section.dart';
import '../../widgets/diffie_hellman_try_out_key_computation_section.dart';
import '../../widgets/diffie_hellman_try_out_key_generation_section.dart';

class DiffieHellmanTryOutMobile extends StatelessWidget {
  const DiffieHellmanTryOutMobile({super.key});

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

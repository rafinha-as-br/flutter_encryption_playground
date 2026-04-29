import 'package:encryption_playground/features/diffie_hellman/presentation/widgets/diffie_hellman_try_out_header_section.dart';
import 'package:flutter/material.dart';
import '../../widgets/diffie_hellman_global_parameters_section.dart';
import '../../widgets/diffie_hellman_try_out_key_computation_section.dart';
import '../../widgets/diffie_hellman_try_out_key_generation_section.dart';


class DiffieHellmanTryOutDesktop extends StatelessWidget {
  const DiffieHellmanTryOutDesktop({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: [
            const DHHeader(),
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



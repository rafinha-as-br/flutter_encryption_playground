import 'package:flutter/material.dart';

import '../../../../app/app_routes.dart';
import '../../../../shared/widgets/shared_header.dart';
import '../pages/diffie_hellman_tab.dart';

class DHHeader extends StatelessWidget {
  const DHHeader({super.key});

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

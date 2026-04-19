import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'try_out_pages/diffie_hellman_try_out_mobile.dart';
import 'try_out_pages/diffie_hellman_try_out_tablet.dart';
import 'try_out_pages/diffie_hellman_try_out_desktop.dart';

class DiffieHellmanTryOut extends StatelessWidget {
  const DiffieHellmanTryOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutBuilder(
      mobile: DiffieHellmanTryOutMobile(),
      tablet: DiffieHellmanTryOutTablet(),
      desktop: DiffieHellmanTryOutDesktop(),
    );
  }
}

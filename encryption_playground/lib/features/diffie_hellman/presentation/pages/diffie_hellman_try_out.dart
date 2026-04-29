import 'package:encryption_playground/features/diffie_hellman/presentation/pages/try_out_pages/diffie_hellman_try_out_desktop.dart';
import 'package:encryption_playground/features/diffie_hellman/presentation/pages/try_out_pages/diffie_hellman_try_out_mobile.dart';
import 'package:encryption_playground/features/diffie_hellman/presentation/pages/try_out_pages/diffie_hellman_try_out_tablet.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

class DiffieHellmanTryOut extends StatelessWidget {
  const DiffieHellmanTryOut({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        mobile: const DiffieHellmanTryOutMobile(),
        tablet: const DiffieHellmanTryOutTablet(),
        desktop: const DiffieHellmanTryOutDesktop(),
    );
  }
}


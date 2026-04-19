import 'package:flutter/material.dart';
import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'about_it_pages/diffie_hellman_about_it_mobile.dart';
import 'about_it_pages/diffie_hellman_about_it_tablet.dart';
import 'about_it_pages/diffie_hellman_about_it_desktop.dart';

class DiffieHellmanAboutIt extends StatelessWidget {
  const DiffieHellmanAboutIt({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutBuilder(
      mobile: DiffieHellmanAboutItMobile(),
      tablet: DiffieHellmanAboutItTablet(),
      desktop: DiffieHellmanAboutItDesktop(),
    );
  }
}

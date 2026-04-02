import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'caesar_cipher_about_it_mobile.dart';
import 'caesar_cipher_about_it_tablet.dart';
import 'caesar_cipher_about_it_desktop.dart';

class CaesarCipherAboutIt extends StatelessWidget {
  const CaesarCipherAboutIt({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutBuilder(
      mobile: CaesarCipherAboutItMobile(),
      tablet: CaesarCipherAboutItTablet(),
      desktop: CaesarCipherAboutItDesktop(),
    );
  }
}

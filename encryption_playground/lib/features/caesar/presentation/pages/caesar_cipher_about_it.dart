import 'package:encryption_playground/features/caesar/presentation/pages/about_it_pages/caesar_cipher_about_it_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'about_it_pages/caesar_cipher_about_it_tablet.dart';
import 'about_it_pages/caesar_cipher_about_it_desktop.dart';

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

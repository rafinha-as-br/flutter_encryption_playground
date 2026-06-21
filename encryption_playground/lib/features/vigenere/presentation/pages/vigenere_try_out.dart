
import 'package:encryption_playground/features/vigenere/presentation/pages/vigenere_try_out_pages/vigenere_try_out_desktop.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

class VigenereTryOutScreen extends StatelessWidget {
  const VigenereTryOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        mobile: VigenereTryOutDesktop(),
        tablet: VigenereTryOutDesktop(),
        desktop: VigenereTryOutDesktop()
    );
  }
}


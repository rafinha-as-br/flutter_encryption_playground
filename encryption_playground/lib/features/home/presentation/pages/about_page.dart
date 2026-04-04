import 'package:encryption_playground/features/home/presentation/pages/about_page_destktop.dart';
import 'package:encryption_playground/features/home/presentation/pages/about_page_mobile.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        mobile: const AboutPageMobile(),
        tablet: const AboutPageDesktop(),
        desktop: const AboutPageDesktop()
    );
  }

}

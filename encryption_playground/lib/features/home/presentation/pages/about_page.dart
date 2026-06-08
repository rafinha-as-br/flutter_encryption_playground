import 'package:encryption_playground/features/home/presentation/pages/about_pages/about_page_destktop.dart';
import 'package:encryption_playground/features/home/presentation/pages/about_pages/about_page_mobile.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

/// Page responsible for the about the project section.
///
/// This widget holds the [ResponsiveLayoutBuilder] for the [AboutPage].
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

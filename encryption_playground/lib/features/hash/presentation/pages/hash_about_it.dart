import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'about_it_pages/hash_about_it_mobile.dart';
import 'about_it_pages/hash_about_it_tablet.dart';
import 'about_it_pages/hash_about_it_desktop.dart';

class HashAboutIt extends StatelessWidget {
  const HashAboutIt({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutBuilder(
      mobile: HashAboutItMobile(),
      tablet: HashAboutItTablet(),
      desktop: HashAboutItDesktop(),
    );
  }
}

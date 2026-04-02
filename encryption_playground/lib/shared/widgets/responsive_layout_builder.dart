import 'package:flutter/material.dart';

import '../../app/app_layout_config.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutType = LayoutConfig.getLayoutType(constraints.maxWidth);
        
        switch (layoutType) {
          case LayoutType.mobile:
            return mobile;
          case LayoutType.tablet:
            return tablet;
          case LayoutType.desktop:
            return desktop;
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

enum ResponsiveLayoutState {
  mobile,
  compact,
  expanded,
}

class ResponsiveLayout {
  static const double mobileLimit = 768;
  static const double compactLimit = 1200;

  static ResponsiveLayoutState current(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < mobileLimit) {
      return ResponsiveLayoutState.mobile;
    } else if (width < compactLimit) {
      return ResponsiveLayoutState.compact;
    } else {
      return ResponsiveLayoutState.expanded;
    }
  }

  static bool isMobile(BuildContext context) =>
      current(context) == ResponsiveLayoutState.mobile;

  static bool isCompact(BuildContext context) =>
      current(context) == ResponsiveLayoutState.compact;

  static bool isExpanded(BuildContext context) =>
      current(context) == ResponsiveLayoutState.expanded;
}

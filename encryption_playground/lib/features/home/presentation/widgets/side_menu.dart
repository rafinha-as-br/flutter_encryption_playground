import 'package:flutter/material.dart';

import '../../../../../shared/responsive/responsive_breakpoints.dart';
import '../constants/sidebar_dimensions.dart';
import 'side_menu_compact.dart';
import 'side_menu_expanded.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ResponsiveLayout.current(context);
    final isCompact = state == ResponsiveLayoutState.compact;
    final isMobile = state == ResponsiveLayoutState.mobile;
    final sideMenuBg = Theme.of(context).colorScheme.surfaceContainerLowest;

    if (isMobile) {
      return Drawer(
        child: Container(
          color: sideMenuBg,
          child: const SideMenuExpanded(),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: isCompact ? SidebarDimensions.compact : SidebarDimensions.expanded,
      color: sideMenuBg,
      child: isCompact ? const SideMenuCompact() : const SideMenuExpanded(),
    );
  }
}


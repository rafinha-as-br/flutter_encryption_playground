
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
        color: AppColors.darkSurfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.darkOutlineVariant),
      ),
      child: child
    );
  }
}

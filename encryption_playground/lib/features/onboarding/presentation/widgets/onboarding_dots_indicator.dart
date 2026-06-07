import 'package:flutter/material.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const OnboardingDotsIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index == currentStep;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: isActive ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: isActive ? colorScheme.primary : colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(4.0),
          ),
        );
      }),
    );
  }
}

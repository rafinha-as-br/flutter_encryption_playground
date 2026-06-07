import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../app/app_injector.dart';
import '../onboarding_controller.dart';
import '../widgets/onboarding_dots_indicator.dart';
import '../widgets/onboarding_step_widget.dart';

/// Responsible for showing the onboarding Steps
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    AppInjector.onboardingService.markCompleted();
    /// Sets the steps back to 0 and closes the onboarding page
    Provider.of<OnboardingController>(context, listen: false).value = 0;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingController>();
    final l10n = AppLocalizations.of(context)!;

    final steps = [
      OnboardingStepWidget(
        title: l10n.onboardingStep1Title,
        message: l10n.onboardingStep1Message,
        icon: Icons.waving_hand_outlined,
      ),
      OnboardingStepWidget(
        title: l10n.onboardingStep2Title,
        message: l10n.onboardingStep2Message,
        icon: Icons.shield_outlined,
      ),
      OnboardingStepWidget(
        title: l10n.onboardingStep3Title,
        message: l10n.onboardingStep3Message,
        icon: Icons.explore_outlined,
      ),
      OnboardingStepWidget(
        title: l10n.onboardingStep4Title,
        message: l10n.onboardingStep4Message,
        icon: Icons.play_circle_outline,
      ),
    ];

    final isLastStep = controller.value == steps.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Skip
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(l10n.onboardingSkip),
                ),
              ),
            ),
            
            // PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: controller.setPage,
                children: steps,
              ),
            ),

            // Bottom Navigation
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  OnboardingDotsIndicator(
                    totalSteps: steps.length,
                    currentStep: controller.value,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isLastStep) {
                          _finishOnboarding();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        isLastStep
                            ? l10n.onboardingStartExploring
                            : l10n.onboardingNext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


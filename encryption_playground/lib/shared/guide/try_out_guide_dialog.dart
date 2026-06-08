import 'dart:ui';
import 'package:encryption_playground/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/widgets/onboarding_dots_indicator.dart';
import '../../features/onboarding/presentation/widgets/onboarding_step_widget.dart';
import '../../app/app_injector.dart';

class GuideStep {
  final String title;
  final String message;
  final IconData icon;

  const GuideStep({
    required this.title,
    required this.message,
    required this.icon,
  });
}

class TryOutGuideDialog extends StatefulWidget {
  final String featureKey;
  final List<GuideStep> steps;

  const TryOutGuideDialog({
    super.key,
    required this.featureKey,
    required this.steps,
  });

  @override
  State<TryOutGuideDialog> createState() => _TryOutGuideDialogState();
}

class _TryOutGuideDialogState extends State<TryOutGuideDialog> {
  late final PageController _pageController;
  int _currentPage = 0;

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

  void _finishGuide() {
    AppInjector.tryOutGuideService.markCompleted(widget.featureKey);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);;
    final isDark = theme.brightness == Brightness.dark;
    final isLastStep = _currentPage == widget.steps.length - 1;

    return BackdropFilter(
      filter: isDark
          ? ImageFilter.blur(sigmaX: 12, sigmaY: 12)
          : ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: isDark
              ? BorderSide(
                  color: theme.colorScheme.primary.withAlpha(51),
                  width: 0.5,
                )
              : BorderSide.none,
        ),
        backgroundColor: isDark
            ? theme.colorScheme.surfaceContainerHighest.withAlpha(200)
            : theme.colorScheme.surfaceContainerHigh,
        child: Container(
          width: double.maxFinite,
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: _finishGuide,
                  icon: const Icon(Icons.close),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: widget.steps.length,
                  itemBuilder: (context, index) {
                    final step = widget.steps[index];
                    return OnboardingStepWidget(
                      title: step.title,
                      message: step.message,
                      icon: step.icon,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              OnboardingDotsIndicator(
                totalSteps: widget.steps.length,
                currentStep: _currentPage,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (isLastStep) {
                      _finishGuide();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(isLastStep ? AppLocalizations.of(context)!.gotIt : AppLocalizations.of(context)!.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> maybeShowTryOutGuide({
  required BuildContext context,
  required String featureKey,
  required List<GuideStep> steps,
}) async {
  if (!AppInjector.tryOutGuideService.isCompleted(featureKey)) {
    await showTryOutGuideDialog(context: context, featureKey: featureKey, steps: steps);
  }
}

Future<void> showTryOutGuideDialog({
  required BuildContext context,
  required String featureKey,
  required List<GuideStep> steps,
}) {
  return showDialog(
    context: context,
    builder: (context) => TryOutGuideDialog(
      featureKey: featureKey,
      steps: steps,
    ),
  );
}

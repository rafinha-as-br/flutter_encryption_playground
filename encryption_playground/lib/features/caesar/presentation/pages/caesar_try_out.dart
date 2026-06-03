import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_desktop.dart';
import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_mobile.dart';
import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_tablet.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../caesar_controller.dart';

/// Responsible for displaying the main page for the Caesar Cypher feature
///
/// This widget holds the [ResponsiveLayoutBuilder] for the [CaesarTryOut] page.
class CaesarTryOut extends StatelessWidget {
  const CaesarTryOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CaesarController>(builder: (context, controller, child) {

      return ResponsiveLayoutBuilder(
          mobile: CaesarTryOutMobile(
              resultValue: controller.result,
              textValue: controller.text,
              onTextChanged: (value) => controller.onTextChanged(newText: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value,),
              onSwapPressed: () => controller.swapEncryption(),
              onSliderChanged: controller.onSliderChanged
          ),
          tablet: CaesarTryOutTablet(
              resultValue: controller.result,
              textValue: controller.text,
              onTextChanged: (value) => controller.onTextChanged(newText: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value),
              onSwapPressed: () => controller.swapEncryption(),
              onSliderChanged: controller.onSliderChanged
          ),
          desktop: CaesarTryOutDesktop(
              resultValue: controller.result,
              textValue: controller.text,
              onTextChanged: (value) => controller.onTextChanged(newText: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value),
              onSwapPressed: () => controller.swapEncryption(),
              onSliderChanged: controller.onSliderChanged
          )
      );
    });
  }
}

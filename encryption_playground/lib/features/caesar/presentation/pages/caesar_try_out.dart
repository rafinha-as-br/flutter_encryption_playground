import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_desktop.dart';
import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_mobile.dart';
import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_tablet.dart';
import 'package:encryption_playground/shared/widgets/responsive_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../caesar_controller.dart';

class CaesarTryOutScreen extends StatefulWidget {
  const CaesarTryOutScreen({super.key});

  @override
  State<CaesarTryOutScreen> createState() => _CaesarTryOutScreenState();
}

class _CaesarTryOutScreenState extends State<CaesarTryOutScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  void _onSwapPressed(){
    final controller = Provider.of<CaesarController>(context, listen: false);
    setState(() {
      _textController.text = controller.result;
      controller.swapEncryption(text: _textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CaesarController>(builder: (context, controller, child) {

      return ResponsiveLayoutBuilder(
          mobile: CaesarTryOutMobile(
              textController: _textController,
              keyController: _keyController,
              resultValue: controller.result,
              onTextChanged: (value) => controller.processText(text: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value, text: _textController.text),
              onSwapPressed: _onSwapPressed,
              onSliderChanged: controller.onSliderChanged
          ),
          tablet: CaesarTryOutDesktop(
              textController: _textController,
              keyController: _keyController,
              resultValue: controller.result,
              onTextChanged: (value) => controller.processText(text: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value, text: _textController.text),
              onSwapPressed: _onSwapPressed,
              onSliderChanged: controller.onSliderChanged
          ),
          desktop: CaesarTryOutTablet(
              textController: _textController,
              keyController: _keyController,
              resultValue: controller.result,
              onTextChanged: (value) => controller.processText(text: value),
              onKeyChanged: (value) => controller.onKeyChanged(newKey: value, text: _textController.text),
              onSwapPressed: _onSwapPressed,
              onSliderChanged: controller.onSliderChanged
          )
      );
    });
  }

}

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
  final TextEditingController _resultController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = Provider.of<CaesarController>(context, listen: false);
    if (controller.key != null && _keyController.text.isEmpty) {
      _keyController.text = controller.key.toString();
    } else if (controller.key == null) {
      controller.key = 3;
      _keyController.text = '3';
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _keyController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    setState(() {});
    _processText();
  }

  void _onKeyChanged(String value) {
    final controller = Provider.of<CaesarController>(context, listen: false);
    int? parsed = int.tryParse(value);
    if (parsed != null) {
      controller.key = parsed;
      _processText();
    }
    setState(() {});
  }

  void _onSliderChanged(double value) {
    _keyController.text = value.toInt().toString();
    _onKeyChanged(_keyController.text);
  }

  void _onSwapPressed() {
    final controller = Provider.of<CaesarController>(context, listen: false);
    controller.isEncrypting = !controller.isEncrypting;
    setState(() {
      final temp = _textController.text;
      _textController.text = _resultController.text;
      _resultController.text = temp;
    });
    _processText();
  }

  void _processText() {
    final controller = Provider.of<CaesarController>(context, listen: false);
    if (controller.key == null || _textController.text.isEmpty) {
      _resultController.text = '';
      return;
    }
    if (controller.isEncrypting) {
      _resultController.text = controller.encrypt(_textController.text);
    } else {
      _resultController.text = controller.decrypt(_textController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CaesarController>(builder: (context, controller, child) {

      return ResponsiveLayoutBuilder(
          mobile: CaesarTryOutMobile(
              textController: _textController,
              keyController: _keyController,
              resultController: _resultController,
              onTextChanged: _onTextChanged,
              onKeyChanged: _onKeyChanged,
              onSwapPressed: _onSwapPressed,
              onSliderChanged: _onSliderChanged
          ),
          tablet: CaesarTryOutDesktop(
              textController: _textController,
              keyController: _keyController,
              resultController: _resultController,
              onTextChanged: _onTextChanged,
              onKeyChanged: _onKeyChanged,
              onSwapPressed: _onSwapPressed,
              onSliderChanged: _onSliderChanged
          ),
          desktop: CaesarTryOutTablet(
              textController: _textController,
              keyController: _keyController,
              resultController: _resultController,
              onTextChanged: _onTextChanged,
              onKeyChanged: _onKeyChanged,
              onSwapPressed: _onSwapPressed,
              onSliderChanged: _onSliderChanged
          )
      );
    });
  }

}

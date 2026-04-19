import 'package:encryption_playground/features/caesar/presentation/pages/try_out_pages/caesar_try_out_tablet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/responsive_layout_builder.dart';
import '../caesar_controller.dart';

import 'try_out_pages/caesar_try_out_mobile.dart';
import 'try_out_pages/caesar_try_out_desktop.dart';

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
    final controller = Provider.of<CaesarController>(context, listen: false);
    if (controller.key == null) return;
    if (controller.isEncrypting) {
      _resultController.text = controller.encrypt(value);
    } else {
      _resultController.text = controller.decrypt(value);
    }
  }

  void _onKeyChanged(String value) {
    setState(() {});
    final controller = Provider.of<CaesarController>(context, listen: false);
    controller.key = int.tryParse(value);
    if (controller.key != null) {
      if (controller.isEncrypting) {
        _resultController.text = controller.encrypt(_textController.text);
      } else {
        _resultController.text = controller.decrypt(_textController.text);
      }
    }
  }

  void _onSwapPressed() {
    final controller = Provider.of<CaesarController>(context, listen: false);
    controller.isEncrypting = !controller.isEncrypting;
    setState(() {
      _textController.text = '';
      _resultController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: CaesarTryOutMobile(
        textController: _textController,
        keyController: _keyController,
        resultController: _resultController,
        onTextChanged: _onTextChanged,
        onKeyChanged: _onKeyChanged,
        onSwapPressed: _onSwapPressed,
      ),
      tablet: CaesarTryOutTablet(
        textController: _textController,
        keyController: _keyController,
        resultController: _resultController,
        onTextChanged: _onTextChanged,
        onKeyChanged: _onKeyChanged,
        onSwapPressed: _onSwapPressed,
      ),
      desktop: CaesarTryOutDesktop(
        textController: _textController,
        keyController: _keyController,
        resultController: _resultController,
        onTextChanged: _onTextChanged,
        onKeyChanged: _onKeyChanged,
        onSwapPressed: _onSwapPressed,
      ),
    );
  }
}

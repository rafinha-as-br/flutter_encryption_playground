import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/default_container.dart';

/// Widget responsible for displaying any input section
class InputSection extends StatefulWidget {
  const InputSection.input({
    super.key,
    required this.onTextChanged,
    required this.isEncrypting,
    required this.resultValue,
    required this.textValue,
  }) : isInput = true;

  const InputSection.result({
    super.key,
    required this.onTextChanged,
    required this.isEncrypting,
    required this.resultValue,
    required this.textValue,
  }) : isInput = false;

  final String resultValue;
  final String textValue;
  final ValueChanged<String> onTextChanged;
  final bool isEncrypting;
  final bool isInput;

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(
      text: widget.isInput
          ? widget.textValue
          : widget.resultValue,
    );
  }

  @override
  void didUpdateWidget(covariant InputSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newValue = widget.isInput
        ? widget.textValue
        : widget.resultValue;

    if (_textController.text != newValue) {
      _textController.text = newValue;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isInput
        ? (widget.isEncrypting ? 'Plaintext' : 'Ciphertext')
        : (widget.isEncrypting ? 'Ciphertext' : 'Plaintext');

    return DefaultContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.darkOnSurface,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _textController,
              maxLines: 5,
              readOnly: !widget.isInput,
              onChanged: widget.isInput ? widget.onTextChanged : null,
              decoration: InputDecoration(
                  hintText: widget.isInput ? 'Enter text here...' : 'Result will appear here...',
                  fillColor: Colors.black
              ),
            ),
          ],
        )
    );
  }
}

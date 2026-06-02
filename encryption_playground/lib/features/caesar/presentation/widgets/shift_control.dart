import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/default_container.dart';

class ShiftControl extends StatefulWidget {
  const ShiftControl({super.key, required this.onKeyChanged,});

  final ValueChanged<String> onKeyChanged;

  @override
  State<ShiftControl> createState() => _ShiftControlState();
}

class _ShiftControlState extends State<ShiftControl> {
  final keyController = TextEditingController();

  int shiftValue = 3;

  void _onSliderChanged(double value){
    final newValue = value.toInt();
    setState(() {
      shiftValue = newValue;
      keyController.text = newValue.toString();
    });
    _onKeyChanged(newValue.toString());
  }

  void _onKeyChanged(String value){
    keyController.text = value;
    widget.onKeyChanged(value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    keyController.text = shiftValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shift Control',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.darkOnSurface,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: shiftValue.toDouble().clamp(-26.0, 26.0),
                    min: -26,
                    max: 26,
                    divisions: 52,
                    label: shiftValue.toString(),
                    activeColor: AppColors.darkPrimary,
                    onChanged: _onSliderChanged,
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: keyController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
                    ],
                    onChanged: _onKeyChanged,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}

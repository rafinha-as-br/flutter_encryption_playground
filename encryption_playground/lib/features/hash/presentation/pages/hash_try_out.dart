import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/shared_header.dart';
import '../../../../app/app_routes.dart';
import '../hash_controller.dart';
import '../widgets/hash_diff_text.dart';
import 'hash_tab.dart'; // For HashNavigationService
import '../../../../l10n/app_localizations.dart';

/// Responsible for displaying the main page for the Hash feature
class HashTryOut extends StatefulWidget {
  const HashTryOut({super.key});

  @override
  State<HashTryOut> createState() => _HashTryOutState();
}

class _HashTryOutState extends State<HashTryOut> {
  final TextEditingController _textAController = TextEditingController();
  final TextEditingController _textBController = TextEditingController();

  final TextEditingController _dartAController = TextEditingController();
  final TextEditingController _dartBController = TextEditingController();

  final TextEditingController _sha1AController = TextEditingController();
  final TextEditingController _sha1BController = TextEditingController();

  final TextEditingController _sha256AController = TextEditingController();
  final TextEditingController _sha256BController = TextEditingController();

  @override
  void dispose() {
    _textAController.dispose();
    _textBController.dispose();
    _dartAController.dispose();
    _dartBController.dispose();
    _sha1AController.dispose();
    _sha1BController.dispose();
    _sha256AController.dispose();
    _sha256BController.dispose();
    super.dispose();
  }

  void _onTextAChanged(String value) {
    final controller = context.read<HashController>();
    _textBController.text = value;
    _onTextBChanged(value);
    if (value.isEmpty) {
      _dartAController.clear();
      _sha1AController.clear();
      _sha256AController.clear();
    } else {
      _dartAController.text = controller.generateDartHascode(value);
      _sha1AController.text = controller.generateSha1Hascode(value);
      _sha256AController.text = controller.generateSha256Hascode(value);
    }
    setState(() {});
  }

  void _onTextBChanged(String value) {
    final controller = context.read<HashController>();
    if (value.isEmpty) {
      _dartBController.clear();
      _sha1BController.clear();
      _sha256BController.clear();
    } else {
      _dartBController.text = controller.generateDartHascode(value);
      _sha1BController.text = controller.generateSha1Hascode(value);
      _sha256BController.text = controller.generateSha256Hascode(value);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SharedHeader(
              title: AppLocalizations.of(context)!.hashFunctionsTitle,
              description: AppLocalizations.of(context)!.hashFunctionsDescription,
              onAboutPressed: () {

                HashNavigationService.instance.navigatorKey.currentState?.pushNamed(AppRoutes.about);
              },
            ),
            const SizedBox(height: 32),

            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildInputColumn(context, AppLocalizations.of(context)!.inputA, _textAController, _dartAController, _sha1AController, _sha256AController, isA: true)),
                      const SizedBox(width: 32),
                      Expanded(child: _buildInputColumn(context, AppLocalizations.of(context)!.inputBCompare, _textBController, _dartBController, _sha1BController, _sha256BController, isA: false)),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildInputColumn(context, AppLocalizations.of(context)!.inputA, _textAController, _dartAController, _sha1AController, _sha256AController, isA: true),
                      const SizedBox(height: 32),
                      _buildInputColumn(context, AppLocalizations.of(context)!.inputBCompare, _textBController, _dartBController, _sha1BController, _sha256BController, isA: false),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputColumn(
    BuildContext context,
    String title,
    TextEditingController input,
    TextEditingController dartOut,
    TextEditingController sha1Out,
    TextEditingController sha256Out, {
    required bool isA,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: input,
            maxLines: 4,
            onChanged: isA ? _onTextAChanged : _onTextBChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
              isDense: true,
              fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
              filled: true,
              hintText: AppLocalizations.of(context)!.enterTextHere,
            ),
          ),
          const SizedBox(height: 24),
          _buildResultItem(context, AppLocalizations.of(context)!.dartHashCode, dartOut, isA ? null : _dartAController),
          const SizedBox(height: 16),
          _buildResultItem(context, AppLocalizations.of(context)!.sha1HashCode, sha1Out, isA ? null : _sha1AController),
          const SizedBox(height: 16),
          _buildResultItem(context, AppLocalizations.of(context)!.sha256HashCode, sha256Out, isA ? null : _sha256AController),
        ],
      ),
    );
  }

  Widget _buildResultItem(BuildContext context, String label, TextEditingController controller, TextEditingController? compareTo) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(2),
          ),
          child: compareTo != null
              ? HashDiffText(text1: controller.text, text2: compareTo.text)
              : Text(
                  controller.text.isEmpty ? AppLocalizations.of(context)!.waitingForInput : controller.text,
                  style: GoogleFonts.jetBrainsMono(
                    color: controller.text.isEmpty ? colorScheme.onSurfaceVariant : colorScheme.primary,
                    fontSize: 14,
                  ),
                ),
        ),
      ],
    );
  }
}

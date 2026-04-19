import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_layout_builder.dart';
import 'try_out_pages/hash_try_out_mobile.dart';
import 'try_out_pages/hash_try_out_tablet.dart';
import 'try_out_pages/hash_try_out_desktop.dart';

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

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: HashTryOutMobile(
        textAController: _textAController,
        textBController: _textBController,
        dartAController: _dartAController,
        dartBController: _dartBController,
        sha1AController: _sha1AController,
        sha1BController: _sha1BController,
        sha256AController: _sha256AController,
        sha256BController: _sha256BController,
      ),
      tablet: HashTryOutTablet(
        textAController: _textAController,
        textBController: _textBController,
        dartAController: _dartAController,
        dartBController: _dartBController,
        sha1AController: _sha1AController,
        sha1BController: _sha1BController,
        sha256AController: _sha256AController,
        sha256BController: _sha256BController,
      ),
      desktop: HashTryOutDesktop(
        textAController: _textAController,
        textBController: _textBController,
        dartAController: _dartAController,
        dartBController: _dartBController,
        sha1AController: _sha1AController,
        sha1BController: _sha1BController,
        sha256AController: _sha256AController,
        sha256BController: _sha256BController,
      ),
    );
  }
}

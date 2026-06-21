import 'package:encryption_playground/shared/widgets/shared_header.dart';
import 'package:flutter/material.dart';

class VigenereTryOutDesktop extends StatelessWidget {
  const VigenereTryOutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SharedHeader(
              title: 'Cifra de vigenere',
              description: 'Cifra de vigenere',
              onAboutPressed: (){},
            ),

          ],
        ),
      ),
    );
  }
}

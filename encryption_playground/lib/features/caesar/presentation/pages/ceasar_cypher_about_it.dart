import 'package:flutter/material.dart';
import 'ceasar_tab.dart';

class CeasarCypherAboutIt extends StatefulWidget {
  const CeasarCypherAboutIt({super.key});

  @override
  State<CeasarCypherAboutIt> createState() => _CeasarCypherAboutItState();
}

class _CeasarCypherAboutItState extends State<CeasarCypherAboutIt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Caesar Cipher'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            CaesarNavigationService.instance.navigatorKey.currentState?.pop();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('The Caesar cipher is one of the earliest known and simplest ciphers.'),
          ],
        ),
      ),
    );
  }
}

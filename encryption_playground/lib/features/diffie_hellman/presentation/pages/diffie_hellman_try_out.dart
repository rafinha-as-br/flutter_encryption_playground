import 'dart:math';
import 'package:flutter/material.dart';

class DiffieHellmanTryOut extends StatefulWidget {
  const DiffieHellmanTryOut({super.key});

  @override
  State<DiffieHellmanTryOut> createState() => _DiffieHellmanTryOutState();
}

class _DiffieHellmanTryOutState extends State<DiffieHellmanTryOut> {

  int modExp(int base, int exp, int mod) {
    int result = 1;
    base = base % mod;

    while (exp > 0) {
      if (exp % 2 == 1) {
        result = (result * base) % mod;
      }
      base = (base * base) % mod;
      exp = exp ~/ 2;
    }

    return result;
  }

  int generatePrivateKey(int p) {
    final random = Random.secure();
    return random.nextInt(p - 2) + 1;
  }

  final TextEditingController gController = TextEditingController();
  final TextEditingController pController = TextEditingController();

  final TextEditingController userAPrivateKeyController = TextEditingController();
  final TextEditingController userBPrivateKeyController = TextEditingController();

  final TextEditingController userAPublicKeyController = TextEditingController();
  final TextEditingController userBPublicKeyController = TextEditingController();

  final TextEditingController sharedSecretAController = TextEditingController();
  final TextEditingController sharedSecretBController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10
        ),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 25,
          childAspectRatio: 2,
          children: [

            _title("User A"),
            const SizedBox(),
            _title("User B"),



            /// ROW 2 (Private Keys)
            _field(userAPrivateKeyController, enabled: false, hint: "Private A"),
            const SizedBox(),
            _field(userBPrivateKeyController, enabled: false, hint: "Private B"),

            /// ROW 3 (CENTER P & G INPUTS)
            const SizedBox(),
            _field(gController, enabled: true, hint: "g"),
            const SizedBox(),

            const SizedBox(),
            _field(pController, enabled: true, hint: "p"),
            const SizedBox(),


            /// ROW 3 (Public Keys)
            _field(userAPublicKeyController, enabled: false, hint: "Public A"),
            const SizedBox(),
            _field(userBPublicKeyController, enabled: false, hint: "Public B"),

            /// ROW 4 (cross-arrows)
            const SizedBox(),
            Icon(Icons.compare_arrows, size: 30),
            const SizedBox(),

            /// ROW 5 (Shared Secret)
            _field(sharedSecretAController, enabled: false, hint: "Shared A"),
            const SizedBox(),
            _field(sharedSecretBController, enabled: false, hint: "Shared B"),
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 40),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _field(TextEditingController controller,
      {bool enabled = true, String? hint}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _centerInputs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: gController,
          decoration: const InputDecoration(
            hintText: 'g',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: pController,
          decoration: const InputDecoration(
            hintText: 'p',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

}
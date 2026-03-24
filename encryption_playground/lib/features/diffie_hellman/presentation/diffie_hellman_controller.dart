
import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiffieHellmanController extends ChangeNotifier{

  int? p;
  int? g;
  final Random _random = Random.secure();


  int generatePrivateKey() {
    return _random.nextInt(p! - 2) + 1;
  }

  int generatePublicKey(int privateKey) {
    return _modExp(g!, privateKey, p!);
  }

  int generateSharedSecret(int privateKey, int receivedPublicKey) {
    return _modExp(receivedPublicKey, privateKey, p!);
  }

  int _modExp(int base, int exp, int mod) {
    int result = 1;
    base %= mod;

    while (exp > 0) {
      if (exp % 2 == 1) {
        result = (result * base) % mod;
      }
      base = (base * base) % mod;
      exp ~/= 2;
    }

    return result;
  }



}
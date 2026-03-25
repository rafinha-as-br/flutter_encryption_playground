
import 'dart:math';

import 'package:flutter/cupertino.dart';

class DiffieHellmanController extends ChangeNotifier {
  int? _p;
  int? _g;

  int? userAPrivateKey;
  int? userBPrivateKey;
  int? userAPublicKey;
  int? userBPublicKey;
  int? sharedSecretA;
  int? sharedSecretB;

  int? get p => _p;
  set p(int? value) {
    _p = value;
    calculate();
  }

  int? get g => _g;
  set g(int? value) {
    _g = value;
    calculate();
  }

  final Random _random = Random.secure();

  void calculate() {
    if (_p == null || _g == null || _p! <= 2) {
      _resetKeys();
      notifyListeners();
      return;
    }

    userAPrivateKey = _generatePrivateKey();
    userBPrivateKey = _generatePrivateKey();

    userAPublicKey = _generatePublicKey(userAPrivateKey!);
    userBPublicKey = _generatePublicKey(userBPrivateKey!);

    sharedSecretA = _generateSharedSecret(userAPrivateKey!, userBPublicKey!);
    sharedSecretB = _generateSharedSecret(userBPrivateKey!, userAPublicKey!);

    notifyListeners();
  }

  void _resetKeys() {
    userAPrivateKey = null;
    userBPrivateKey = null;
    userAPublicKey = null;
    userBPublicKey = null;
    sharedSecretA = null;
    sharedSecretB = null;
  }

  int _generatePrivateKey() {
    return _random.nextInt(_p! - 2) + 1;
  }

  int _generatePublicKey(int privateKey) {
    return _modExp(_g!, privateKey, _p!);
  }

  int _generateSharedSecret(int privateKey, int receivedPublicKey) {
    return _modExp(receivedPublicKey, privateKey, _p!);
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
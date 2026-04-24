import 'package:encryption_playground/features/diffie_hellman/domain/generate_public_key_usecase.dart';
import 'package:encryption_playground/features/diffie_hellman/domain/mod_exp_usecase.dart';
import 'package:flutter/cupertino.dart';

import '../domain/generate_private_key_usecase.dart';

class DiffieHellmanController extends ChangeNotifier {

  final TextEditingController userAPrivateKeyController = TextEditingController();
  final TextEditingController userBPrivateKeyController = TextEditingController();

  final TextEditingController userAPublicKeyController = TextEditingController();
  final TextEditingController userBPublicKeyController = TextEditingController();

  final TextEditingController sharedSecretAController = TextEditingController();
  final TextEditingController sharedSecretBController = TextEditingController();

  final TextEditingController gController = TextEditingController();
  final TextEditingController pController = TextEditingController();

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


  void calculate() {
    if (_p == null || _g == null || _p! <= 2) {
      _resetKeys();
      notifyListeners();
      return;
    }

    userAPrivateKey = _generatePrivateKey();
    _updateTextIfChanged(userAPrivateKeyController, userAPrivateKey);
    userBPrivateKey = _generatePrivateKey();
    _updateTextIfChanged(userBPrivateKeyController, userBPrivateKey);


    userAPublicKey = _generatePublicKey(userAPrivateKey!);
    _updateTextIfChanged(userAPublicKeyController, userAPublicKey);

    userBPublicKey = _generatePublicKey(userBPrivateKey!);
    _updateTextIfChanged(userBPublicKeyController, userBPublicKey);

    sharedSecretA = _generateSharedSecret(userAPrivateKey!, userBPublicKey!);
    _updateTextIfChanged(sharedSecretAController, sharedSecretA);

    sharedSecretB = _generateSharedSecret(userBPrivateKey!, userAPublicKey!);
    _updateTextIfChanged(sharedSecretBController, sharedSecretB);


    notifyListeners();
  }

  void _updateTextIfChanged(TextEditingController textController, int? value) {
    final newText = value?.toString() ?? "";
    if (textController.text != newText) {
      textController.text = newText;
    }
  }


  void reset() {
    _p = null;
    _g = null;
    _resetKeys();
    _resetControllersTexts();
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

  void _resetControllersTexts(){
    userAPrivateKeyController.text = '';
    userBPrivateKeyController.text = '';

    userAPublicKeyController.text = '';
    userBPublicKeyController.text = '';
    sharedSecretAController.text = '';
    sharedSecretBController.text = '';

    gController.text = '';
    pController.text = '';
  }

  int _generatePrivateKey() {
    return DiffieHellmanPrivateKeyUseCase.generatePrivateKey(_p!);
  }

  int _generatePublicKey(int privateKey) {
    return DiffieHellmanPublicKeyUseCase.generatePublicKey(privateKey, _g!, _p!);
  }

  int _generateSharedSecret(int privateKey, int receivedPublicKey) {
    return DiffieHellmanModExpUseCase.modExp(receivedPublicKey, privateKey, _p!);
  }

  @override
  void dispose() {
    super.dispose();
    userAPrivateKeyController.dispose();
    userBPrivateKeyController.dispose();
    userAPublicKeyController.dispose();
    userBPublicKeyController.dispose();
    sharedSecretAController.dispose();
    sharedSecretBController.dispose();
    gController.dispose();
    pController.dispose();

  }
}

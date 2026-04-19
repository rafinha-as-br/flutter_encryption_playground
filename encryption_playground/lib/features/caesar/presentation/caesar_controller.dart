
import 'package:encryption_playground/features/caesar/domain/do_encrypt_usecase.dart';
import 'package:flutter/material.dart';

import '../domain/do_uncrypt_usecase.dart';

class CaesarController extends ChangeNotifier{

  bool isEncrypting = true;
  int? key;

  String encrypt(String text){
    return doEncryptUseCase(key!, text);
  }

  String decrypt(String text){
    return doUncryptUseCase(key!, text);
  }


}
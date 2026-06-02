
import 'package:encryption_playground/features/caesar/domain/do_encrypt_usecase.dart';
import 'package:flutter/material.dart';

import '../domain/do_uncrypt_usecase.dart';

class CaesarController extends ChangeNotifier{

  bool isEncrypting = true;
  int? key;
  String result = '';


  String encrypt({required int key, required String text}){
    return doEncryptUseCase(key, text);
  }

  String decrypt({required int key, required String text}){
    return doUncryptUseCase(key, text);
  }

  /// On text changed method
  void onTextChanged({required String newText}){
    processText(text: newText);
  }

  /// On key changed method.
  /// Parsers the new key to an integer and notifies listeners
  void onKeyChanged({required String newKey, required String text}){
    key = int.parse(newKey);

    processText(text: text);
  }

  /// On slider changed
  void onSliderChanged(double value){
    key = value.toInt();
    processText(text: result);
  }

  /// Swap encryption/decryption method
  void swapEncryption({required String text}){
    isEncrypting = !isEncrypting;
    processText(text: text);
  }

  /// Process text method, receives a text and returns a processed text.
  /// Validating empty text or null key
  void processText({required String text}){

    /// If key or text is empty return empty string
    if(key != null && text.isNotEmpty ){
      if(isEncrypting){
        result = encrypt(key: key!, text: text);
      }else{
        result = decrypt(key: key!, text: text);
      }
    } else{
      result = '';
    }

    notifyListeners();
  }



}
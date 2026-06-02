
import 'package:encryption_playground/features/caesar/domain/do_encrypt_usecase.dart';
import 'package:flutter/material.dart';

import '../domain/do_uncrypt_usecase.dart';

class CaesarController extends ChangeNotifier{

  bool isEncrypting = true;
  int key = 3;

  /// Plaintext or ciphertext
  String text = '';
  /// Encryption/decryption result
  String result = '';


  String encrypt({required int key, required String text}){
    return doEncryptUseCase(key, text);
  }

  String decrypt({required int key, required String text}){
    return doUncryptUseCase(key, text);
  }

  /// On text changed method
  void onTextChanged({required String newText}){
    updateText(newText);
    _processText();
  }

  /// Update controller text
  void updateText(String newText){
    text = newText;
    notifyListeners();
  }


  /// On key changed method.
  /// Parsers the new key to an integer and notifies listeners
  void onKeyChanged({required String newKey}){
    key = int.parse(newKey);

    _processText();
  }

  /// On slider changed
  void onSliderChanged(double value){
    key = value.toInt();
    _processText();
  }

  /// Swap encryption/decryption method
  void swapEncryption(){
    isEncrypting = !isEncrypting;
    _processText();
  }

  /// Process text method, receives a text and returns a processed text.
  /// Validating empty text or null key
  void _processText(){

    /// If key or text is empty return empty string
    if(text.isNotEmpty){
      if(isEncrypting){
        result = encrypt(key: key, text: text);
      }else{
        result = decrypt(key: key, text: text);
      }
    } else{
      result = '';
    }

    notifyListeners();
  }



}

import 'package:encryption_playground/features/vigenere/domain/keyword_corrector.dart';

/// Receives a plaintext and a keyword, returns the encrypted text
String vigenereEncryption({required String plaintext, required String keyword}){
  String encryptedText = '';
  final String keyWordCorreted = keywordCorrector(plaintext: plaintext, keyword: keyword);
  final String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';


  /// loops the plaintext letters to build the encrypted text
  for(int i=0; i<plaintext.length; i++) {
    final keyLetter = keyWordCorreted[i];
    final encryptedLetter = alphabet[alphabet.indexOf(keyLetter)];
    encryptedText = encryptedText + encryptedLetter;
  }


  return encryptedText;
}


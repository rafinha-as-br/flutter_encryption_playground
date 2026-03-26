
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';

class HashController extends ChangeNotifier{

  /// dart hashcode method
  String generateDartHascode(String text){
    return text.hashCode.toString();
  }

  /// sha-1 hashcode method
  String generateSha1Hascode(String text){
    final bytes = utf8.encode(text);
    final digest = sha1.convert(bytes);
    return digest.toString();
  }

  /// sha256 hashcode method
  String generateSha256Hascode(String text){
    final bytes = utf8.encode(text);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }



}
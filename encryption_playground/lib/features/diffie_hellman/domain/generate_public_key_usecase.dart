import 'package:encryption_playground/features/diffie_hellman/domain/mod_exp_usecase.dart';

abstract class DiffieHellmanPublicKeyUseCase{

  /// method to generate a public key from a private key
  static int generatePublicKey(int privateKey, int generator, int modulus){
    return DiffieHellmanModExpUseCase.modExp(generator, privateKey, modulus);
  }

}

import 'dart:math';

abstract class DiffieHellmanPrivateKeyUseCase{

  /// explanation about the private key from diffie hellman
  static String aboutIt = '';

  /// generate private key method
  static int generatePrivateKey(int p){
    final Random random = Random.secure();
    return random.nextInt(p - 2) + 1;
  }

}
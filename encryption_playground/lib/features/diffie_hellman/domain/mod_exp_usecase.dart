abstract class DiffieHellmanModExpUseCase{

  /// about the exponential module
  static String aboutIt = '';

  /// exponential module method
  static int modExp(int base, int exp, int mod){
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
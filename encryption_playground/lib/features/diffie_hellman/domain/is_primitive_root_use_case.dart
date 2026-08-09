abstract class DiffieHellmanIsPrimitiveRootUseCase{

  /// Checks whether [g] is a primitive root modulo [p].
  ///
  /// Only meaningful when [p] is prime: g is a primitive root when its
  /// powers (mod p) cycle through every value from 1 to p-1 exactly once
  /// before repeating, i.e. it generates the full multiplicative group.
  static bool isPrimitiveRoot(int g, int p){
    if (p <= 2 || g <= 0) return false;

    final Set<int> generatedValues = {};
    int value = 1;
    for (int exponent = 1; exponent < p; exponent++) {
      value = (value * g) % p;
      if (!generatedValues.add(value)) return false;
    }

    return generatedValues.length == p - 1;
  }

}

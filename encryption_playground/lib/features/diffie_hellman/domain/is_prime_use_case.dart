abstract class DiffieHellmanIsPrimeUseCase{

  /// checks whether [number] is a prime number
  static bool isPrime(int number){
    if (number < 2) return false;
    if (number == 2) return true;
    if (number.isEven) return false;

    for (int divisor = 3; divisor * divisor <= number; divisor += 2) {
      if (number % divisor == 0) return false;
    }

    return true;
  }

}

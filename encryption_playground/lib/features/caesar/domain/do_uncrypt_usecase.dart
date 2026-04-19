/* receives a crypted message and the key for doing the decryption, returns an decrypted message */

String doUncryptUseCase(int key, String text){
  final String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  String decryptedString = '';
  for(int i=0; i<text.length; i++){
    String letter = text[i].toUpperCase();
    int letterIndex = alphabet.indexOf(letter);

    if (letterIndex == -1) {
      decryptedString += letter; // mantém caracteres não alfabéticos
      continue;
    }

    int newIndex = (letterIndex - key) % alphabet.length;
    if (newIndex < 0) newIndex += alphabet.length;

    decryptedString += alphabet[newIndex];
  }

  return decryptedString;
}

/*receives a message and the key for doing the encryption, returns an encrypted message */

String doEncryptUseCase(int key, String text){
  final String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  String encryptedString = '';
  for(int i=0; i<text.length; i++){
    String letter = text[i].toUpperCase();
    int letterIndex = alphabet.indexOf(letter);

    if (letterIndex == -1) {
      encryptedString += letter;
      continue;
    }

    int newIndex = (letterIndex + key) % alphabet.length;
    encryptedString += alphabet[newIndex];
  }

  return encryptedString;
}

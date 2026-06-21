
/// Verifies the keyword length and if is smaller, returns the correct filled keyword
String keywordCorrector({required String plaintext, required String keyword}){
  if(keyword.length >= plaintext.length) return keyword;
  String keywordCorrected = keyword;

  while(keywordCorrected.length < plaintext.length){
    keywordCorrected = keywordCorrected + keyword;
  }


  return keywordCorrected;
}
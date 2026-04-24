// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Playground de Criptografia';

  @override
  String get caesar => 'César';

  @override
  String get diffieHellman => 'Diffie-Hellman';

  @override
  String get hash => 'Hash';

  @override
  String get caesarTryOut => 'Experimentar César';

  @override
  String get diffieHellmanTryOut => 'Experimentar Diffie Hellman';

  @override
  String get hashCodeTryOut => 'Experimentar HashCode';

  @override
  String get enterTextToEncrypt => 'Digite o texto para criptografar';

  @override
  String get enterTextToDecrypt => 'Digite o texto para descriptografar';

  @override
  String get enterKey => 'Digite a chave';

  @override
  String get encryptedText => 'Texto criptografado';

  @override
  String get decryptedText => 'Texto descriptografado';

  @override
  String get userA => 'Usuário A';

  @override
  String get userB => 'Usuário B';

  @override
  String get privateKey => 'Chave Privada';

  @override
  String get publicKey => 'Chave Pública';

  @override
  String get sharedSecret => 'Segredo Compartilhado';

  @override
  String get globalParameters => 'Parâmetros Globais';

  @override
  String get generator => 'G (Base / Gerador)';

  @override
  String get modulus => 'P (Módulo / Primo)';

  @override
  String get inputA => 'Entrada A';

  @override
  String get inputB => 'Entrada B';

  @override
  String get enterText => 'Digite o texto';

  @override
  String get dartHashCode => 'Dart hashcode';

  @override
  String get sha1HashCode => 'sha-1 hashcode';

  @override
  String get sha256HashCode => 'Hashcode SHA-256';

  @override
  String get close => 'Fechar';

  @override
  String get aboutCaesarTitle => 'Sobre o algoritmo de Cifra de César';

  @override
  String get whatIsCaesarTitle => '📌 O que é';

  @override
  String get whatIsCaesarContent =>
      'A Cifra de César é um algoritmo de criptografia simétrica extremamente simples, baseado em substituição.\n\nEla funciona deslocando cada letra do alfabeto por um número fixo de posições.\n\nExemplo (deslocamento de 3):\nA → D\nB → E\nC → F\n...';

  @override
  String get originCaesarTitle => '🏛️ Origem Histórica';

  @override
  String get originCaesarContent =>
      'A cifra leva o nome de Júlio César, que a utilizava para proteger comunicações militares durante o período da República Romana (por volta de 50 a.C.).\n\nEle usava um deslocamento fixo de 3 letras para enviar mensagens aos seus generais.';

  @override
  String get howItWorksCaesarTitle => '⚙️ Como funciona (conceitualmente)';

  @override
  String get howItWorksCaesarContent =>
      '• Define-se um número inteiro chamado chave (shift)\n• Para cada letra:\n  - Localiza sua posição no alfabeto\n  - Soma o valor do deslocamento\n  - Aplica módulo 26 (para \"dar a volta\" no alfabeto)';

  @override
  String get characteristicsCaesarTitle => '🧠 Características Técnicas';

  @override
  String get characteristicsCaesarContent =>
      '• Tipo: Criptografia simétrica\n• Complexidade: Muito baixa\n• Segurança: Praticamente inexistente\n• Espaço de chaves: Apenas 25 possibilidades';

  @override
  String get usageHistoryCaesarTitle => '⚔️ Uso ao Longo da História';

  @override
  String get usageHistoryCaesarContent =>
      '• Comunicação militar na Roma Antiga\n• Base conceitual para criptografia clássica\n• Muito usada em ensino introdutório de segurança';

  @override
  String get limitationsCaesarTitle => '🚨 Limitações';

  @override
  String get limitationsCaesarContent =>
      '• Vulnerável a análise de frequência\n• Pode ser quebrada por força bruta em segundos\n• Não oferece confidencialidade real hoje';

  @override
  String get currentUsageCaesarTitle => '📱 Uso Atual';

  @override
  String get currentUsageCaesarContent =>
      '• Ensino de criptografia\n• Jogos e puzzles\n• Demonstração de conceitos básicos';

  @override
  String get aboutDiffieHellmanTitle => 'Sobre o algoritmo Diffie-Hellman';

  @override
  String get whatIsDiffieHellmanTitle => '📌 O que é';

  @override
  String get whatIsDiffieHellmanContent =>
      'O Algoritmo de Diffie-Hellman é um método de troca segura de chaves criptográficas.\n\nEle permite que duas partes criem uma chave secreta compartilhada sem nunca transmiti-la diretamente.';

  @override
  String get originDiffieHellmanTitle => '🏛️ Origem Histórica';

  @override
  String get originDiffieHellmanContent =>
      'Proposto em 1976 por:\n• Whitfield Diffie\n• Martin Hellman\n\nFoi o primeiro método prático de criptografia de chave pública.';

  @override
  String get ideaDiffieHellmanTitle => '💡 Ideia Central';

  @override
  String get ideaDiffieHellmanContent =>
      'Resolver o problema:\n\"Como duas pessoas podem compartilhar um segredo sem nunca terem se comunicado antes de forma segura?\"';

  @override
  String get howItWorksDiffieHellmanTitle =>
      '⚙️ Como funciona (conceitualmente)';

  @override
  String get howItWorksDiffieHellmanContent =>
      '1. Ambas as partes concordam publicamente em:\n   - Um número primo grande (p)\n   - Um gerador (g)\n2. Cada lado escolhe um segredo privado:\n   - A escolhe a\n   - B escolhe b\n3. Calculam valores públicos:';

  @override
  String get step45DiffieHellmanContent =>
      '4. Trocam A e B\n5. Calculam a chave compartilhada:';

  @override
  String get mathConceptDiffieHellmanTitle => '🧠 Conceito Matemático';

  @override
  String get mathConceptDiffieHellmanContent =>
      'Baseado no problema do logaritmo discreto.\n\nEsse problema é computacionalmente difícil de resolver, garantindo segurança.';

  @override
  String get characteristicsDiffieHellmanTitle =>
      '🛡️ Características Técnicas';

  @override
  String get characteristicsDiffieHellmanContent =>
      '• Tipo: Criptografia de chave pública\n• Objetivo: Troca de chaves, não criptografia direta\n• Segurança: Alta (com parâmetros corretos)\n• Base: Matemática modular';

  @override
  String get usageHistoryDiffieHellmanTitle => '🌐 Uso ao Longo da História';

  @override
  String get usageHistoryDiffieHellmanContent =>
      'Base para protocolos modernos como:\n• TLS/HTTPS\n• VPNs\n• SSH';

  @override
  String get currentUsageDiffieHellmanTitle => '📱 Uso Atual';

  @override
  String get currentUsageDiffieHellmanContent =>
      '• Estabelecimento de conexões seguras na internet\n• Aplicações bancárias\n• Comunicação criptografada';

  @override
  String get limitationsDiffieHellmanTitle => '🚨 Limitações';

  @override
  String get limitationsDiffieHellmanContent =>
      '• Vulnerável a ataques Man-in-the-Middle se não autenticado\n• Requer uso com certificados digitais';

  @override
  String get aboutHashTitle => 'Sobre o algoritmo de Hash';

  @override
  String get whatIsHashTitle => '📌 O que é';

  @override
  String get whatIsHashContent =>
      'Uma função hash transforma um dado de entrada de tamanho arbitrário em uma saída de tamanho fixo.';

  @override
  String get originHashTitle => '🏛️ Origem Histórica';

  @override
  String get originHashContent =>
      'O conceito surgiu dentro da computação, especialmente em estruturas de dados nos anos 1950–1970.\n\nCom o avanço da criptografia, surgiram funções hash criptográficas modernas como:\n• MD5\n• SHA-1\n• SHA-256';

  @override
  String get howItWorksHashTitle => '⚙️ Como funciona (conceitualmente)';

  @override
  String get howItWorksHashContent =>
      '• Recebe uma entrada qualquer\n• Aplica uma série de transformações matemáticas\n• Produz um valor fixo (hash)';

  @override
  String get importantPropertiesHashTitle => '🧠 Propriedades Importantes';

  @override
  String get importantPropertiesHashContent =>
      'Uma boa função hash deve ter:\n\n• Determinismo: Mesma entrada → mesma saída\n• Rapidez: Computação eficiente\n• Efeito avalanche: Pequena mudança → saída completamente diferente\n• Resistência a colisões: Difícil encontrar duas entradas com mesmo hash';

  @override
  String get characteristicsHashTitle => '🛡️ Características Técnicas';

  @override
  String get characteristicsHashContent =>
      '• Tipo: Função unidirecional\n• Não reversível\n• Usada para integridade e verificação';

  @override
  String get usageHistoryHashTitle => '🌐 Uso ao Longo da História';

  @override
  String get usageHistoryHashContent =>
      '• Estruturas de dados (HashMap, HashTable)\n• Armazenamento seguro de senhas\n• Assinaturas digitais';

  @override
  String get currentUsageHashTitle => '📱 Uso Atual';

  @override
  String get currentUsageHashContent =>
      '• Autenticação de usuários\n• Blockchain\n• Verificação de integridade de arquivos\n• Sistemas distribuídos';

  @override
  String get limitationsHashTitle => '🚨 Limitações';

  @override
  String get limitationsHashContent =>
      '• Colisões são possíveis (dependendo do algoritmo)\n• Algoritmos antigos (MD5, SHA-1) são considerados inseguros';

  @override
  String get importantObservationHashTitle =>
      '⚠️ Observação importante (arquitetural)';

  @override
  String get importantObservationHashContent =>
      'Hash ≠ criptografia reversível\n\n• Criptografia → pode ser revertida com chave\n• Hash → não pode ser revertido (idealmente)';

  @override
  String get dartHashCodeTitle => 'Dart hashCode';

  @override
  String get dartHashCodeDescription =>
      'O hashCode do Dart é um identificador numérico usado internamente para estruturas como Map e Set. Ele NÃO é criptograficamente seguro e pode variar entre execuções. Serve apenas para comparação rápida.';

  @override
  String get sha1HashCodeTitle => 'SHA-1';

  @override
  String get sha1HashCodeDescription =>
      'SHA-1 é um algoritmo de hash criptográfico que gera um valor de 160 bits. Hoje é considerado inseguro para uso em segurança, pois possui colisões conhecidas. É útil aqui apenas para fins didáticos.';

  @override
  String get sha256HashCodeTitle => 'SHA-256';

  @override
  String get sha256HashCodeDescription =>
      'SHA-256 é um algoritmo de hash criptográfico da família SHA-2 que gera um valor de 256 bits. É amplamente utilizado em segurança, blockchain e armazenamento seguro de dados.';

  @override
  String get inputTextTitle => 'Input de texto';

  @override
  String get inputTextDescription =>
      'Coloque uma entrada de dados para gerar os hashcodes, experimente mudar o texto e veja o resultado';

  @override
  String get reset => 'Redefinir';

  @override
  String get invalidInput => 'Entrada inválida';

  @override
  String get lettersOnly => 'Por favor, digite apenas letras';

  @override
  String get numbersOnly => 'Por favor, digite apenas números';

  @override
  String get theme => 'Tema';

  @override
  String get about => 'Sobre';

  @override
  String get localeNameDisplay => 'PT';

  @override
  String get randomlyGenerated => 'Número gerado aleatoriamente';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Encryption Playground';

  @override
  String get caesar => 'Caesar';

  @override
  String get diffieHellman => 'Diffie-Hellman';

  @override
  String get hash => 'Hash';

  @override
  String get caesarTryOut => 'Caesar Try Out';

  @override
  String get diffieHellmanTryOut => 'Diffie Hellman try out';

  @override
  String get hashCodeTryOut => 'HashCode try out';

  @override
  String get enterTextToEncrypt => 'Enter text to encrypt';

  @override
  String get enterTextToDecrypt => 'Enter text to decrypt';

  @override
  String get enterKey => 'Enter key';

  @override
  String get encryptedText => 'Encrypted text';

  @override
  String get decryptedText => 'Decrypted text';

  @override
  String get userA => 'User A';

  @override
  String get userB => 'User B';

  @override
  String get privateKey => 'Private Key';

  @override
  String get publicKey => 'Public Key';

  @override
  String get sharedSecret => 'Shared Secret';

  @override
  String get globalParameters => 'Global Parameters';

  @override
  String get generator => 'G (Base / Generator)';

  @override
  String get modulus => 'P (Modulus / Prime)';

  @override
  String get inputA => 'Input A';

  @override
  String get inputB => 'Input B';

  @override
  String get enterText => 'Enter text';

  @override
  String get dartHashCode => 'Dart hashcode';

  @override
  String get sha1HashCode => 'sha-1 hashcode';

  @override
  String get sha256HashCode => 'SHA-256 HashCode';

  @override
  String get close => 'Close';

  @override
  String get aboutCaesarTitle => 'About Caesar Cipher algorithm';

  @override
  String get whatIsCaesarTitle => '📌 What is it';

  @override
  String get whatIsCaesarContent =>
      'The Caesar Cipher is an extremely simple symmetric encryption algorithm based on substitution.\n\nIt works by shifting each letter of the alphabet by a fixed number of positions.\n\nExample (shift of 3):\nA → D\nB → E\nC → F\n...';

  @override
  String get originCaesarTitle => '🏛️ Historical Origin';

  @override
  String get originCaesarContent =>
      'The cipher is named after Julius Caesar, who used it to protect military communications during the Roman Republic period (around 50 BC).\n\nHe used a fixed shift of 3 letters to send messages to his generals.';

  @override
  String get howItWorksCaesarTitle => '⚙️ How it works (conceptually)';

  @override
  String get howItWorksCaesarContent =>
      '• An integer called the shift value (k) is defined\n• For each letter:\n  - Locate its position in the alphabet\n  - Add the shift value\n  - Apply modulo 26 (to \"wrap around\" the alphabet)';

  @override
  String get characteristicsCaesarTitle => '🧠 Technical Characteristics';

  @override
  String get characteristicsCaesarContent =>
      '• Type: Symmetric encryption\n• Complexity: Very low\n• Security: Practically non-existent\n• Key space: Only 25 possibilities';

  @override
  String get usageHistoryCaesarTitle => '⚔️ Usage throughout History';

  @override
  String get usageHistoryCaesarContent =>
      '• Military communication in Ancient Rome\n• Conceptual basis for classical cryptography\n• Widely used in introductory security teaching';

  @override
  String get limitationsCaesarTitle => '🚨 Limitations';

  @override
  String get limitationsCaesarContent =>
      '• Vulnerable to frequency analysis\n• Can be broken by brute force in seconds\n• Does not offer real confidentiality today';

  @override
  String get currentUsageCaesarTitle => '📱 Current Usage';

  @override
  String get currentUsageCaesarContent =>
      '• Teaching cryptography\n• Games and puzzles\n• Demonstration of basic concepts';

  @override
  String get aboutDiffieHellmanTitle => 'About Diffie-Hellman algorithm';

  @override
  String get whatIsDiffieHellmanTitle => '📌 What is it';

  @override
  String get whatIsDiffieHellmanContent =>
      'The Diffie-Hellman algorithm is a method for secure cryptographic key exchange.\n\nIt allows two parties to create a shared secret key without ever transmitting it directly.';

  @override
  String get originDiffieHellmanTitle => '🏛️ Historical Origin';

  @override
  String get originDiffieHellmanContent =>
      'Proposed in 1976 by:\n• Whitfield Diffie\n• Martin Hellman\n\nIt was the first practical method of public-key cryptography.';

  @override
  String get ideaDiffieHellmanTitle => '💡 Central Idea';

  @override
  String get ideaDiffieHellmanContent =>
      'Solving the problem:\n\"How can two people share a secret without ever having communicated securely before?\"';

  @override
  String get howItWorksDiffieHellmanTitle => '⚙️ How it works (conceptually)';

  @override
  String get howItWorksDiffieHellmanContent =>
      '1. Both parties publicly agree on:\n   - A large prime number (p)\n   - A generator (g)\n2. Each side chooses a private secret:\n   - A chooses a\n   - B chooses b\n3. Calculate public values:';

  @override
  String get step45DiffieHellmanContent =>
      '4. Exchange A and B\n5. Calculate shared key:';

  @override
  String get mathConceptDiffieHellmanTitle => '🧠 Mathematical Concept';

  @override
  String get mathConceptDiffieHellmanContent =>
      'Based on the discrete logarithm problem.\n\nThis problem is computationally hard to solve, ensuring security.';

  @override
  String get characteristicsDiffieHellmanTitle =>
      '🛡️ Technical Characteristics';

  @override
  String get characteristicsDiffieHellmanContent =>
      '• Type: Public-key cryptography\n• Goal: Key exchange, not direct encryption\n• Security: High (with correct parameters)\n• Base: Modular mathematics';

  @override
  String get usageHistoryDiffieHellmanTitle => '🌐 Usage throughout History';

  @override
  String get usageHistoryDiffieHellmanContent =>
      'Basis for modern protocols like:\n• TLS/HTTPS\n• VPNs\n• SSH';

  @override
  String get currentUsageDiffieHellmanTitle => '📱 Current Usage';

  @override
  String get currentUsageDiffieHellmanContent =>
      '• Establishing secure connections on the internet\n• Banking applications\n• Encrypted communication';

  @override
  String get limitationsDiffieHellmanTitle => '🚨 Limitations';

  @override
  String get limitationsDiffieHellmanContent =>
      '• Vulnerable to Man-in-the-Middle attacks if not authenticated\n• Requires use with digital certificates';

  @override
  String get aboutHashTitle => 'About Hash algorithm';

  @override
  String get whatIsHashTitle => '📌 What is it';

  @override
  String get whatIsHashContent =>
      'A hash function transforms input data of arbitrary size into an output of fixed size.';

  @override
  String get originHashTitle => '🏛️ Historical Origin';

  @override
  String get originHashContent =>
      'The concept emerged within computing, especially in data structures in the 1950s–1970s.\n\nWith the advancement of cryptography, modern cryptographic hash functions emerged such as:\n• MD5\n• SHA-1\n• SHA-256';

  @override
  String get howItWorksHashTitle => '⚙️ How it works (conceptually)';

  @override
  String get howItWorksHashContent =>
      '• Receives any input\n• Applies a series of mathematical transformations\n• Produces a fixed value (hash)';

  @override
  String get importantPropertiesHashTitle => '🧠 Important Properties';

  @override
  String get importantPropertiesHashContent =>
      'A good hash function must have:\n\n• Determinism: Same input → same output\n• Speed: Efficient computation\n• Avalanche effect: Small change → completely different output\n• Collision resistance: Difficult to find two inputs with the same hash';

  @override
  String get characteristicsHashTitle => '🛡️ Technical Characteristics';

  @override
  String get characteristicsHashContent =>
      '• Type: One-way function\n• Non-reversible\n• Used for integrity and verification';

  @override
  String get usageHistoryHashTitle => '🌐 Usage throughout History';

  @override
  String get usageHistoryHashContent =>
      '• Data structures (HashMap, HashTable)\n• Secure password storage\n• Digital signatures';

  @override
  String get currentUsageHashTitle => '📱 Current Usage';

  @override
  String get currentUsageHashContent =>
      '• User authentication\n• Blockchain\n• File integrity verification\n• Distributed systems';

  @override
  String get limitationsHashTitle => '🚨 Limitations';

  @override
  String get limitationsHashContent =>
      '• Collisions are possible (depending on the algorithm)\n• Old algorithms (MD5, SHA-1) are considered insecure';

  @override
  String get importantObservationHashTitle =>
      '⚠️ Important Observation (architectural)';

  @override
  String get importantObservationHashContent =>
      'Hash ≠ reversible encryption\n\n• Encryption → can be reversed with a key\n• Hash → cannot be reversed (ideally)';

  @override
  String get dartHashCodeTitle => 'Dart hashCode';

  @override
  String get dartHashCodeDescription =>
      'Dart\'s hashCode is a numeric identifier used internally for structures like Map and Set. It is NOT cryptographically secure and may vary between executions. It serves only for quick comparison.';

  @override
  String get sha1HashCodeTitle => 'SHA-1';

  @override
  String get sha1HashCodeDescription =>
      'SHA-1 is a cryptographic hash algorithm that generates a 160-bit value. Today it is considered insecure for security use as it has known collisions. It is useful here only for educational purposes.';

  @override
  String get sha256HashCodeTitle => 'SHA-256';

  @override
  String get sha256HashCodeDescription =>
      'SHA-256 is a cryptographic hash algorithm from the SHA-2 family that generates a 256-bit value. It is widely used in security, blockchain, and secure data storage.';

  @override
  String get inputTextTitle => 'Text Input';

  @override
  String get inputTextDescription =>
      'Enter data to generate hashcodes, try changing the text and see the result';

  @override
  String get reset => 'Reset';

  @override
  String get invalidInput => 'Invalid input';

  @override
  String get lettersOnly => 'Please enter letters only';

  @override
  String get numbersOnly => 'Please enter numbers only';

  @override
  String get theme => 'Theme';

  @override
  String get about => 'About';

  @override
  String get localeNameDisplay => 'EN';
}

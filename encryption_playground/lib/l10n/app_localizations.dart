import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Encryption Playground'**
  String get appName;

  /// No description provided for @caesar.
  ///
  /// In en, this message translates to:
  /// **'Caesar'**
  String get caesar;

  /// No description provided for @diffieHellman.
  ///
  /// In en, this message translates to:
  /// **'Diffie-Hellman'**
  String get diffieHellman;

  /// No description provided for @hash.
  ///
  /// In en, this message translates to:
  /// **'Hash'**
  String get hash;

  /// No description provided for @caesarTryOut.
  ///
  /// In en, this message translates to:
  /// **'Caesar Try Out'**
  String get caesarTryOut;

  /// No description provided for @diffieHellmanTryOut.
  ///
  /// In en, this message translates to:
  /// **'Diffie Hellman try out'**
  String get diffieHellmanTryOut;

  /// No description provided for @hashCodeTryOut.
  ///
  /// In en, this message translates to:
  /// **'HashCode try out'**
  String get hashCodeTryOut;

  /// No description provided for @enterTextToEncrypt.
  ///
  /// In en, this message translates to:
  /// **'Enter text to encrypt'**
  String get enterTextToEncrypt;

  /// No description provided for @enterTextToDecrypt.
  ///
  /// In en, this message translates to:
  /// **'Enter text to decrypt'**
  String get enterTextToDecrypt;

  /// No description provided for @enterKey.
  ///
  /// In en, this message translates to:
  /// **'Enter key'**
  String get enterKey;

  /// No description provided for @encryptedText.
  ///
  /// In en, this message translates to:
  /// **'Encrypted text'**
  String get encryptedText;

  /// No description provided for @decryptedText.
  ///
  /// In en, this message translates to:
  /// **'Decrypted text'**
  String get decryptedText;

  /// No description provided for @userA.
  ///
  /// In en, this message translates to:
  /// **'User A'**
  String get userA;

  /// No description provided for @userB.
  ///
  /// In en, this message translates to:
  /// **'User B'**
  String get userB;

  /// No description provided for @privateKey.
  ///
  /// In en, this message translates to:
  /// **'Private Key'**
  String get privateKey;

  /// No description provided for @publicKey.
  ///
  /// In en, this message translates to:
  /// **'Public Key'**
  String get publicKey;

  /// No description provided for @sharedSecret.
  ///
  /// In en, this message translates to:
  /// **'Shared Secret'**
  String get sharedSecret;

  /// No description provided for @globalParameters.
  ///
  /// In en, this message translates to:
  /// **'Global Parameters'**
  String get globalParameters;

  /// No description provided for @globalParametersTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Global Parameters'**
  String get globalParametersTitle;

  /// No description provided for @primeModulus.
  ///
  /// In en, this message translates to:
  /// **'Prime Modulus (P)'**
  String get primeModulus;

  /// No description provided for @primeModulusHint.
  ///
  /// In en, this message translates to:
  /// **'A large prime number (e.g. 23)'**
  String get primeModulusHint;

  /// No description provided for @generatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Generator (G)'**
  String get generatorLabel;

  /// No description provided for @generatorHint.
  ///
  /// In en, this message translates to:
  /// **'A primitive root modulo P (e.g. 5)'**
  String get generatorHint;

  /// No description provided for @keyGenerationTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Key Generation'**
  String get keyGenerationTitle;

  /// No description provided for @autoGenerated.
  ///
  /// In en, this message translates to:
  /// **'Auto-generated'**
  String get autoGenerated;

  /// No description provided for @computed.
  ///
  /// In en, this message translates to:
  /// **'Computed'**
  String get computed;

  /// No description provided for @publicKeyFormula.
  ///
  /// In en, this message translates to:
  /// **'Public Key - (G^ private key) mod P'**
  String get publicKeyFormula;

  /// No description provided for @swap.
  ///
  /// In en, this message translates to:
  /// **'Swap'**
  String get swap;

  /// No description provided for @generator.
  ///
  /// In en, this message translates to:
  /// **'G (Base / Generator)'**
  String get generator;

  /// No description provided for @modulus.
  ///
  /// In en, this message translates to:
  /// **'P (Modulus / Prime)'**
  String get modulus;

  /// No description provided for @inputA.
  ///
  /// In en, this message translates to:
  /// **'Input A'**
  String get inputA;

  /// No description provided for @inputB.
  ///
  /// In en, this message translates to:
  /// **'Input B'**
  String get inputB;

  /// No description provided for @enterText.
  ///
  /// In en, this message translates to:
  /// **'Enter text'**
  String get enterText;

  /// No description provided for @dartHashCode.
  ///
  /// In en, this message translates to:
  /// **'Dart hashcode'**
  String get dartHashCode;

  /// No description provided for @sha1HashCode.
  ///
  /// In en, this message translates to:
  /// **'sha-1 hashcode'**
  String get sha1HashCode;

  /// No description provided for @sha256HashCode.
  ///
  /// In en, this message translates to:
  /// **'SHA-256 HashCode'**
  String get sha256HashCode;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @aboutCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'About Caesar Cipher algorithm'**
  String get aboutCaesarTitle;

  /// No description provided for @whatIsCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'📌 What is it'**
  String get whatIsCaesarTitle;

  /// No description provided for @whatIsCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'The Caesar Cipher is an extremely simple symmetric encryption algorithm based on substitution.\n\nIt works by shifting each letter of the alphabet by a fixed number of positions.\n\nExample (shift of 3):\nA → D\nB → E\nC → F\n...'**
  String get whatIsCaesarContent;

  /// No description provided for @originCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'🏛️ Historical Origin'**
  String get originCaesarTitle;

  /// No description provided for @originCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'The cipher is named after Julius Caesar, who used it to protect military communications during the Roman Republic period (around 50 BC).\n\nHe used a fixed shift of 3 letters to send messages to his generals.'**
  String get originCaesarContent;

  /// No description provided for @howItWorksCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'⚙️ How it works (conceptually)'**
  String get howItWorksCaesarTitle;

  /// No description provided for @howItWorksCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'• An integer called the shift value (k) is defined\n• For each letter:\n  - Locate its position in the alphabet\n  - Add the shift value\n  - Apply modulo 26 (to \"wrap around\" the alphabet)'**
  String get howItWorksCaesarContent;

  /// No description provided for @characteristicsCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'🧠 Technical Characteristics'**
  String get characteristicsCaesarTitle;

  /// No description provided for @characteristicsCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'• Type: Symmetric encryption\n• Complexity: Very low\n• Security: Practically non-existent\n• Key space: Only 25 possibilities'**
  String get characteristicsCaesarContent;

  /// No description provided for @usageHistoryCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'⚔️ Usage throughout History'**
  String get usageHistoryCaesarTitle;

  /// No description provided for @usageHistoryCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'• Military communication in Ancient Rome\n• Conceptual basis for classical cryptography\n• Widely used in introductory security teaching'**
  String get usageHistoryCaesarContent;

  /// No description provided for @limitationsCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'🚨 Limitations'**
  String get limitationsCaesarTitle;

  /// No description provided for @limitationsCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'• Vulnerable to frequency analysis\n• Can be broken by brute force in seconds\n• Does not offer real confidentiality today'**
  String get limitationsCaesarContent;

  /// No description provided for @currentUsageCaesarTitle.
  ///
  /// In en, this message translates to:
  /// **'📱 Current Usage'**
  String get currentUsageCaesarTitle;

  /// No description provided for @currentUsageCaesarContent.
  ///
  /// In en, this message translates to:
  /// **'• Teaching cryptography\n• Games and puzzles\n• Demonstration of basic concepts'**
  String get currentUsageCaesarContent;

  /// No description provided for @aboutDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'About Diffie-Hellman algorithm'**
  String get aboutDiffieHellmanTitle;

  /// No description provided for @whatIsDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'📌 What is it'**
  String get whatIsDiffieHellmanTitle;

  /// No description provided for @whatIsDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'The Diffie-Hellman algorithm is a method for secure cryptographic key exchange.\n\nIt allows two parties to create a shared secret key without ever transmitting it directly.'**
  String get whatIsDiffieHellmanContent;

  /// No description provided for @originDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'🏛️ Historical Origin'**
  String get originDiffieHellmanTitle;

  /// No description provided for @originDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'Proposed in 1976 by:\n• Whitfield Diffie\n• Martin Hellman\n\nIt was the first practical method of public-key cryptography.'**
  String get originDiffieHellmanContent;

  /// No description provided for @ideaDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'💡 Central Idea'**
  String get ideaDiffieHellmanTitle;

  /// No description provided for @ideaDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'Solving the problem:\n\"How can two people share a secret without ever having communicated securely before?\"'**
  String get ideaDiffieHellmanContent;

  /// No description provided for @howItWorksDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'⚙️ How it works (conceptually)'**
  String get howItWorksDiffieHellmanTitle;

  /// No description provided for @howItWorksDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'1. Both parties publicly agree on:\n   - A large prime number (p)\n   - A generator (g)\n2. Each side chooses a private secret:\n   - A chooses a\n   - B chooses b\n3. Calculate public values:'**
  String get howItWorksDiffieHellmanContent;

  /// No description provided for @step45DiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'4. Exchange A and B\n5. Calculate shared key:'**
  String get step45DiffieHellmanContent;

  /// No description provided for @mathConceptDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'🧠 Mathematical Concept'**
  String get mathConceptDiffieHellmanTitle;

  /// No description provided for @mathConceptDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'Based on the discrete logarithm problem.\n\nThis problem is computationally hard to solve, ensuring security.'**
  String get mathConceptDiffieHellmanContent;

  /// No description provided for @characteristicsDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'🛡️ Technical Characteristics'**
  String get characteristicsDiffieHellmanTitle;

  /// No description provided for @characteristicsDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'• Type: Public-key cryptography\n• Goal: Key exchange, not direct encryption\n• Security: High (with correct parameters)\n• Base: Modular mathematics'**
  String get characteristicsDiffieHellmanContent;

  /// No description provided for @usageHistoryDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'🌐 Usage throughout History'**
  String get usageHistoryDiffieHellmanTitle;

  /// No description provided for @usageHistoryDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'Basis for modern protocols like:\n• TLS/HTTPS\n• VPNs\n• SSH'**
  String get usageHistoryDiffieHellmanContent;

  /// No description provided for @currentUsageDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'📱 Current Usage'**
  String get currentUsageDiffieHellmanTitle;

  /// No description provided for @currentUsageDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'• Establishing secure connections on the internet\n• Banking applications\n• Encrypted communication'**
  String get currentUsageDiffieHellmanContent;

  /// No description provided for @limitationsDiffieHellmanTitle.
  ///
  /// In en, this message translates to:
  /// **'🚨 Limitations'**
  String get limitationsDiffieHellmanTitle;

  /// No description provided for @limitationsDiffieHellmanContent.
  ///
  /// In en, this message translates to:
  /// **'• Vulnerable to Man-in-the-Middle attacks if not authenticated\n• Requires use with digital certificates'**
  String get limitationsDiffieHellmanContent;

  /// No description provided for @aboutHashTitle.
  ///
  /// In en, this message translates to:
  /// **'About Hash algorithm'**
  String get aboutHashTitle;

  /// No description provided for @whatIsHashTitle.
  ///
  /// In en, this message translates to:
  /// **'📌 What is it'**
  String get whatIsHashTitle;

  /// No description provided for @whatIsHashContent.
  ///
  /// In en, this message translates to:
  /// **'A hash function transforms input data of arbitrary size into an output of fixed size.'**
  String get whatIsHashContent;

  /// No description provided for @originHashTitle.
  ///
  /// In en, this message translates to:
  /// **'🏛️ Historical Origin'**
  String get originHashTitle;

  /// No description provided for @originHashContent.
  ///
  /// In en, this message translates to:
  /// **'The concept emerged within computing, especially in data structures in the 1950s–1970s.\n\nWith the advancement of cryptography, modern cryptographic hash functions emerged such as:\n• MD5\n• SHA-1\n• SHA-256'**
  String get originHashContent;

  /// No description provided for @howItWorksHashTitle.
  ///
  /// In en, this message translates to:
  /// **'⚙️ How it works (conceptually)'**
  String get howItWorksHashTitle;

  /// No description provided for @howItWorksHashContent.
  ///
  /// In en, this message translates to:
  /// **'• Receives any input\n• Applies a series of mathematical transformations\n• Produces a fixed value (hash)'**
  String get howItWorksHashContent;

  /// No description provided for @importantPropertiesHashTitle.
  ///
  /// In en, this message translates to:
  /// **'🧠 Important Properties'**
  String get importantPropertiesHashTitle;

  /// No description provided for @importantPropertiesHashContent.
  ///
  /// In en, this message translates to:
  /// **'A good hash function must have:\n\n• Determinism: Same input → same output\n• Speed: Efficient computation\n• Avalanche effect: Small change → completely different output\n• Collision resistance: Difficult to find two inputs with the same hash'**
  String get importantPropertiesHashContent;

  /// No description provided for @characteristicsHashTitle.
  ///
  /// In en, this message translates to:
  /// **'🛡️ Technical Characteristics'**
  String get characteristicsHashTitle;

  /// No description provided for @characteristicsHashContent.
  ///
  /// In en, this message translates to:
  /// **'• Type: One-way function\n• Non-reversible\n• Used for integrity and verification'**
  String get characteristicsHashContent;

  /// No description provided for @usageHistoryHashTitle.
  ///
  /// In en, this message translates to:
  /// **'🌐 Usage throughout History'**
  String get usageHistoryHashTitle;

  /// No description provided for @usageHistoryHashContent.
  ///
  /// In en, this message translates to:
  /// **'• Data structures (HashMap, HashTable)\n• Secure password storage\n• Digital signatures'**
  String get usageHistoryHashContent;

  /// No description provided for @currentUsageHashTitle.
  ///
  /// In en, this message translates to:
  /// **'📱 Current Usage'**
  String get currentUsageHashTitle;

  /// No description provided for @currentUsageHashContent.
  ///
  /// In en, this message translates to:
  /// **'• User authentication\n• Blockchain\n• File integrity verification\n• Distributed systems'**
  String get currentUsageHashContent;

  /// No description provided for @limitationsHashTitle.
  ///
  /// In en, this message translates to:
  /// **'🚨 Limitations'**
  String get limitationsHashTitle;

  /// No description provided for @limitationsHashContent.
  ///
  /// In en, this message translates to:
  /// **'• Collisions are possible (depending on the algorithm)\n• Old algorithms (MD5, SHA-1) are considered insecure'**
  String get limitationsHashContent;

  /// No description provided for @importantObservationHashTitle.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Important Observation (architectural)'**
  String get importantObservationHashTitle;

  /// No description provided for @importantObservationHashContent.
  ///
  /// In en, this message translates to:
  /// **'Hash ≠ reversible encryption\n\n• Encryption → can be reversed with a key\n• Hash → cannot be reversed (ideally)'**
  String get importantObservationHashContent;

  /// No description provided for @dartHashCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dart hashCode'**
  String get dartHashCodeTitle;

  /// No description provided for @dartHashCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'Dart\'s hashCode is a numeric identifier used internally for structures like Map and Set. It is NOT cryptographically secure and may vary between executions. It serves only for quick comparison.'**
  String get dartHashCodeDescription;

  /// No description provided for @sha1HashCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'SHA-1'**
  String get sha1HashCodeTitle;

  /// No description provided for @sha1HashCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'SHA-1 is a cryptographic hash algorithm that generates a 160-bit value. Today it is considered insecure for security use as it has known collisions. It is useful here only for educational purposes.'**
  String get sha1HashCodeDescription;

  /// No description provided for @sha256HashCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'SHA-256'**
  String get sha256HashCodeTitle;

  /// No description provided for @sha256HashCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'SHA-256 is a cryptographic hash algorithm from the SHA-2 family that generates a 256-bit value. It is widely used in security, blockchain, and secure data storage.'**
  String get sha256HashCodeDescription;

  /// No description provided for @inputTextTitle.
  ///
  /// In en, this message translates to:
  /// **'Text Input'**
  String get inputTextTitle;

  /// No description provided for @inputTextDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter data to generate hashcodes, try changing the text and see the result'**
  String get inputTextDescription;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get invalidInput;

  /// No description provided for @lettersOnly.
  ///
  /// In en, this message translates to:
  /// **'Please enter letters only'**
  String get lettersOnly;

  /// No description provided for @numbersOnly.
  ///
  /// In en, this message translates to:
  /// **'Please enter numbers only'**
  String get numbersOnly;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @localeNameDisplay.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get localeNameDisplay;

  /// No description provided for @randomlyGenerated.
  ///
  /// In en, this message translates to:
  /// **'Randomly generated number'**
  String get randomlyGenerated;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Encryption Playground'**
  String get welcomeTitle;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore cryptographic algorithms, see how they work under the hood, and test them out interactively.'**
  String get welcomeDescription;

  /// No description provided for @learnMoreAboutProject.
  ///
  /// In en, this message translates to:
  /// **'Learn more about the project'**
  String get learnMoreAboutProject;

  /// No description provided for @exploreFeatures.
  ///
  /// In en, this message translates to:
  /// **'Explore Features'**
  String get exploreFeatures;

  /// No description provided for @cipherSuite.
  ///
  /// In en, this message translates to:
  /// **'Cipher Suite'**
  String get cipherSuite;

  /// No description provided for @cipherSuiteDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore classic and modern substitution ciphers like the Caesar cipher.'**
  String get cipherSuiteDescription;

  /// No description provided for @symmetricSuite.
  ///
  /// In en, this message translates to:
  /// **'Symmetric Suite'**
  String get symmetricSuite;

  /// No description provided for @symmetricSuiteDescription.
  ///
  /// In en, this message translates to:
  /// **'Test symmetric encryption algorithms where the same key encrypts and decrypts.'**
  String get symmetricSuiteDescription;

  /// No description provided for @asymmetricSuite.
  ///
  /// In en, this message translates to:
  /// **'Asymmetric Suite'**
  String get asymmetricSuite;

  /// No description provided for @asymmetricSuiteDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn about public-key cryptography and key exchange protocols like Diffie-Hellman.'**
  String get asymmetricSuiteDescription;

  /// A description of the dashboard page
  ///
  /// In en, this message translates to:
  /// **'A dashboard overview'**
  String get dashboardDescription;

  /// Title for the first onboarding step
  ///
  /// In en, this message translates to:
  /// **'Welcome to Encryption Playground'**
  String get onboardingStep1Title;

  /// Message for the first onboarding step
  ///
  /// In en, this message translates to:
  /// **'A space to learn and experiment with cryptography in a practical way. No prior knowledge is necessary.'**
  String get onboardingStep1Message;

  /// Title for the second onboarding step
  ///
  /// In en, this message translates to:
  /// **'Experiment without fear'**
  String get onboardingStep2Title;

  /// Message for the second onboarding step
  ///
  /// In en, this message translates to:
  /// **'Everything happens on your device. No data is sent to servers. Test, make mistakes, and learn freely.'**
  String get onboardingStep2Message;

  /// Title for the third onboarding step
  ///
  /// In en, this message translates to:
  /// **'What you can do'**
  String get onboardingStep3Title;

  /// Message for the third onboarding step
  ///
  /// In en, this message translates to:
  /// **'Encrypt and decrypt texts, explore different algorithms, adjust parameters, and compare results side by side.'**
  String get onboardingStep3Message;

  /// Title for the fourth onboarding step
  ///
  /// In en, this message translates to:
  /// **'Start with Caesar Cipher'**
  String get onboardingStep4Title;

  /// Message for the fourth onboarding step
  ///
  /// In en, this message translates to:
  /// **'Caesar Cipher is the simplest algorithm and a great starting point. Choose a suite from the menu and start experimenting!'**
  String get onboardingStep4Message;

  /// Skip button text in onboarding
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// Next button text in onboarding
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// Start exploring button text in onboarding
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get onboardingStartExploring;

  /// Button to review the tutorial in the side menu
  ///
  /// In en, this message translates to:
  /// **'Review Tutorial'**
  String get reviewTutorial;

  /// No description provided for @hashSuite.
  ///
  /// In en, this message translates to:
  /// **'Hash Suite'**
  String get hashSuite;

  /// No description provided for @hashSuiteDescription.
  ///
  /// In en, this message translates to:
  /// **'Generate cryptographic hashes using MD5, SHA-1, SHA-256 and more.'**
  String get hashSuiteDescription;

  /// No description provided for @cipherSuiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Substitution and transposition ciphers, classical encryption methods.'**
  String get cipherSuiteSubtitle;

  /// No description provided for @caesarCipherDescription.
  ///
  /// In en, this message translates to:
  /// **'A classic substitution cipher where each letter is shifted by a fixed number of positions.'**
  String get caesarCipherDescription;

  /// No description provided for @tryOut.
  ///
  /// In en, this message translates to:
  /// **'Try out'**
  String get tryOut;

  /// No description provided for @symmetricSuiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Algorithms that use the same cryptographic keys for both encryption of plaintext and decryption of ciphertext.'**
  String get symmetricSuiteSubtitle;

  /// No description provided for @aesComingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'AES (Coming Soon)'**
  String get aesComingSoonTitle;

  /// No description provided for @aesComingSoonDescription.
  ///
  /// In en, this message translates to:
  /// **'Advanced Encryption Standard is a symmetric block cipher chosen by the U.S. government to protect classified information.'**
  String get aesComingSoonDescription;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @asymmetricSuiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Algorithms that require two separate keys, one of which is secret (or private) and one of which is public.'**
  String get asymmetricSuiteSubtitle;

  /// No description provided for @diffieHellmanDescription.
  ///
  /// In en, this message translates to:
  /// **'A method of securely exchanging cryptographic keys over a public channel.'**
  String get diffieHellmanDescription;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @keyComputationTitle.
  ///
  /// In en, this message translates to:
  /// **'3. Key Computation'**
  String get keyComputationTitle;

  /// No description provided for @userAComputesSharedKey.
  ///
  /// In en, this message translates to:
  /// **'User A computes shared key:'**
  String get userAComputesSharedKey;

  /// No description provided for @userBComputesSharedKey.
  ///
  /// In en, this message translates to:
  /// **'User B computes shared key:'**
  String get userBComputesSharedKey;

  /// No description provided for @resetParameters.
  ///
  /// In en, this message translates to:
  /// **'Reset Parameters'**
  String get resetParameters;

  /// No description provided for @aboutProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'About the Project'**
  String get aboutProjectTitle;

  /// No description provided for @aboutProjectText.
  ///
  /// In en, this message translates to:
  /// **'This project was developed during the Information Security course, during the first semester of 2026, to demonstrate how cryptography algorithms work.'**
  String get aboutProjectText;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About the application'**
  String get aboutApp;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @hashFunctionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Hash Functions'**
  String get hashFunctionsTitle;

  /// No description provided for @hashFunctionsDescription.
  ///
  /// In en, this message translates to:
  /// **'A hash function maps data of arbitrary size to fixed-size values. Try altering a single letter and notice how the entire output changes.'**
  String get hashFunctionsDescription;

  /// No description provided for @waitingForInput.
  ///
  /// In en, this message translates to:
  /// **'Waiting for input...'**
  String get waitingForInput;

  /// No description provided for @inputBCompare.
  ///
  /// In en, this message translates to:
  /// **'Input B (Compare)'**
  String get inputBCompare;

  /// No description provided for @enterTextHere.
  ///
  /// In en, this message translates to:
  /// **'Enter text here...'**
  String get enterTextHere;

  /// No description provided for @guide.
  ///
  /// In en, this message translates to:
  /// **'Guide'**
  String get guide;

  /// No description provided for @caesarGuideStep1Title.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get caesarGuideStep1Title;

  /// No description provided for @caesarGuideStep1Message.
  ///
  /// In en, this message translates to:
  /// **'The Caesar cipher substitutes letters by shifting them in the alphabet.'**
  String get caesarGuideStep1Message;

  /// No description provided for @caesarGuideStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Adjust the shift'**
  String get caesarGuideStep2Title;

  /// No description provided for @caesarGuideStep2Message.
  ///
  /// In en, this message translates to:
  /// **'Use the slider to change the shift key and see the formula and alphabet visualization update.'**
  String get caesarGuideStep2Message;

  /// No description provided for @caesarGuideStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Try it out'**
  String get caesarGuideStep3Title;

  /// No description provided for @caesarGuideStep3Message.
  ///
  /// In en, this message translates to:
  /// **'Enter text in the input field to see the encrypted or decrypted result. Use the Swap button to switch modes.'**
  String get caesarGuideStep3Message;

  /// No description provided for @dhGuideStep1Title.
  ///
  /// In en, this message translates to:
  /// **'What is this?'**
  String get dhGuideStep1Title;

  /// No description provided for @dhGuideStep1Message.
  ///
  /// In en, this message translates to:
  /// **'Diffie-Hellman allows two users to create a shared secret key without transmitting it.'**
  String get dhGuideStep1Message;

  /// No description provided for @dhGuideStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Set Global Parameters'**
  String get dhGuideStep2Title;

  /// No description provided for @dhGuideStep2Message.
  ///
  /// In en, this message translates to:
  /// **'Set the prime (P) and generator (G) in the global parameters section.'**
  String get dhGuideStep2Message;

  /// No description provided for @dhGuideStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Key Generation'**
  String get dhGuideStep3Title;

  /// No description provided for @dhGuideStep3Message.
  ///
  /// In en, this message translates to:
  /// **'Private keys are auto-generated and public keys are calculated with the formula.'**
  String get dhGuideStep3Message;

  /// No description provided for @dhGuideStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Shared Secret'**
  String get dhGuideStep4Title;

  /// No description provided for @dhGuideStep4Message.
  ///
  /// In en, this message translates to:
  /// **'Both users arrive at the same shared key, even without exchanging private keys.'**
  String get dhGuideStep4Message;

  /// No description provided for @hashGuideStep1Title.
  ///
  /// In en, this message translates to:
  /// **'What are Hash Functions?'**
  String get hashGuideStep1Title;

  /// No description provided for @hashGuideStep1Message.
  ///
  /// In en, this message translates to:
  /// **'Hash functions transform any input into a fixed-size value, irreversibly.'**
  String get hashGuideStep1Message;

  /// No description provided for @hashGuideStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Compare the hashes'**
  String get hashGuideStep2Title;

  /// No description provided for @hashGuideStep2Message.
  ///
  /// In en, this message translates to:
  /// **'Type text in Input A and slightly alter it in Input B to see the avalanche effect.'**
  String get hashGuideStep2Message;

  /// No description provided for @hashGuideStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Different Algorithms'**
  String get hashGuideStep3Title;

  /// No description provided for @hashGuideStep3Message.
  ///
  /// In en, this message translates to:
  /// **'Observe the differences between Dart hashCode, SHA-1, and SHA-256.'**
  String get hashGuideStep3Message;

  /// No description provided for @tooltipCaesarShift.
  ///
  /// In en, this message translates to:
  /// **'Adjust how many positions each letter shifts in the alphabet'**
  String get tooltipCaesarShift;

  /// No description provided for @tooltipCaesarSwap.
  ///
  /// In en, this message translates to:
  /// **'Switch between encryption and decryption mode'**
  String get tooltipCaesarSwap;

  /// No description provided for @tooltipCaesarFormula.
  ///
  /// In en, this message translates to:
  /// **'The mathematical formula used to encrypt/decrypt'**
  String get tooltipCaesarFormula;

  /// No description provided for @tooltipDhPrime.
  ///
  /// In en, this message translates to:
  /// **'A large prime number that both parties agree on publicly'**
  String get tooltipDhPrime;

  /// No description provided for @tooltipDhGenerator.
  ///
  /// In en, this message translates to:
  /// **'A primitive root modulo P, used as the base for calculations'**
  String get tooltipDhGenerator;

  /// No description provided for @tooltipDhPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'A secret number known only to this user'**
  String get tooltipDhPrivateKey;

  /// No description provided for @tooltipDhPublicKey.
  ///
  /// In en, this message translates to:
  /// **'Calculated from the private key — safe to share publicly'**
  String get tooltipDhPublicKey;

  /// No description provided for @tooltipDhSharedSecret.
  ///
  /// In en, this message translates to:
  /// **'Both users arrive at the same key without sharing their secrets'**
  String get tooltipDhSharedSecret;

  /// No description provided for @tooltipHashDart.
  ///
  /// In en, this message translates to:
  /// **'Dart\'s internal hash — not cryptographically secure'**
  String get tooltipHashDart;

  /// No description provided for @tooltipHashSha1.
  ///
  /// In en, this message translates to:
  /// **'160-bit cryptographic hash — considered insecure today'**
  String get tooltipHashSha1;

  /// No description provided for @tooltipHashSha256.
  ///
  /// In en, this message translates to:
  /// **'256-bit secure hash — widely used in modern security'**
  String get tooltipHashSha256;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

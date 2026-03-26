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

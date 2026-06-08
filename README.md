# Encryption Playground 🔐

[🇺🇸 English](README.md) | [🇧🇷 Português](README-PT.md)

Encryption Playground is an educational Flutter application designed to demonstrate fundamental cryptographic concepts through interactive experiences. It provides users with a hands-on laboratory to experiment with historical and modern encryption algorithms.

For detailed technical information on how the Flutter project is structured, please see the [Flutter Project README](encryption_playground/README.md).

## Project Motivation

During a Data Security class, the students were challenged to develop an implementation of the Caesar Cipher in any framework of their preference. During the development of the Caesar algorithm, the idea of an education app containing more encryption algorithms came up, and then I developed this simple and small App.

## Features

### 1. Caesar Cipher
- **Educational Content**: Information about the history and mechanics of the Julius Caesar substitution cipher.
- **Interactive Simulation**: Encrypt and decrypt messages using custom shift keys.
- **Real-time Feedback**: Immediate visualization of character transformations.

### 2. Diffie-Hellman Key Exchange
- **Core Concept**: Demonstration of how two parties (User A & User B) establish a shared secret over an insecure channel.
- **Interactive Simulation**:
    - Configuration of global parameters (Generator and Modulus).
    - Visualization of public key calculation and exchange.
    - Verification of the shared secret derivation on both sides.

### 3. Hash Functions
- **Integrity Verification**: Comparison of inputs to demonstrate the "Avalanche Effect" (where small input changes result in vastly different outputs).
- **Algorithm Comparison**: Support for multiple hashing methods including:
    - Default Dart HashCode
    - SHA-1
    - SHA-256

### 4. User Interface and Experience
- **Dynamic Theming**: Full implementation of Dark Mode (Primary) and Light Mode (Secondary) based on structured design tokens.
- **Internationalization**: Seamless switching between English and Portuguese (PT-BR).
- **Responsive Design**: Clean, tab-based navigation optimized for mobile and desktop views.

## Concepts Covered

- Symmetric Encryption
- Key Exchange Protocols
- One-way Hash Functions
- Avalanche Effect
- Data Integrity vs Confidentiality

## How to Run

You can access the Vercel website: [https://flutter-encryption-playground.vercel.app/](https://flutter-encryption-playground.vercel.app/).
Or you can clone into your remote and test on a mobile emulator by running the code inside the `encryption_playground` directory.

## Screenshots

![image.png](/docs/images/image.png)

![image.png](/docs/images/image%201.png)

![image.png](/docs/images/image%202.png)    

## Future Improvements

- Addition of the Vigenere Cipher
- More improvements will be announced in the future
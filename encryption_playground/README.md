# Flutter Project Structure - Encryption Playground

[🇺🇸 English](README.md) | [🇧🇷 Português](README-PT.md)

This directory contains the actual Flutter application source code.

## Technical Stack

The project leverages modern Flutter development patterns and libraries:

- **State Management**: Implemented using the **Provider** package for efficient reactive updates.
- **Architecture**: Follows **Feature-First** and **Clean Architecture** patterns, separating the codebase into Domain and Presentation layers.
- **Domain Logic**: Use of **Use Cases** to encapsulate business rules and encryption algorithms, promoting testability and reusability.
- **Internationalization (i18n)**: Utilizes `flutter_localizations` and ARB files for multi-language support.
- **Theme Management**: Centralized `ThemeData` configuration consuming custom AppColors tokens for consistent styling across brightness modes.
- **Navigation**: Structured using **Navigator 1.0** with feature-scoped **Navigation Services** to decouple UI from routing logic.
- **Dependency Injection**: Basic dependency management via Provider and bootstrap injectors.
- **Input Handling**: Robust handling of hardware and software keyboards with form validation and real-time text processing.

## Project Structure

The structure is highly modular, following a feature-based approach:

```text
lib/
├── app/                  # Core application configuration
│   ├── app.dart          # Main application widget
│   ├── app_bootstrap.dart# App initialization 
│   ├── app_injector.dart # Dependency Injection setup
│   ├── app_layout_config.dart # Responsive layout constants
│   ├── app_routes.dart   # Route definitions
│   ├── locale_controller.dart # Language selection state
│   ├── package_info_service.dart # App package info
│   └── theme_controller.dart  # Theme selection state
├── features/             # Feature-based modular architecture
│   ├── caesar/           # Caesar Cipher implementation
│   ├── diffie_hellman/   # Key exchange simulation logic
│   ├── hash/             # Hashing algorithms and comparison tools
│   ├── home/             # Root navigation and dashboard
│   └── onboarding/       # Initial onboarding flow
├── l10n/                 # ARB localization resources
├── shared/               # Shared components, themes, and utilities
│   ├── guide/            # UI guidelines and typography
│   ├── responsive/       # Responsive widgets and layouts
│   ├── theme/            # Theme tokens, colors, and global styles
│   └── widgets/          # Reusable UI components
└── main.dart             # Application entry point
```

## Running the App

To run the application locally:

1. Ensure you have Flutter installed and configured.
2. Navigate to this directory (`encryption_playground`).
3. Fetch the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Running Tests

To run unit and widget tests:
```bash
flutter test
```

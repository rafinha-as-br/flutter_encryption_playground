# Release Notes - v1.1.0

This release turns Encryption Playground into a more polished and guided learning experience.

## Highlights

- New dashboard with cards for ciphers, symmetric encryption, asymmetric encryption, and hash functions.
- Guided onboarding shown on first launch, with local persistence.
- Contextual help dialogs across Caesar, Diffie-Hellman, and Hash try-out screens.
- Improved responsive layouts for desktop, tablet, and mobile.
- Updated branding assets for light and dark themes.
- Local theme and language toggles in the side menu, plus visible app version.

## Added

- Dashboard landing page with direct access to the main cryptography suites.
- Onboarding flow with multiple steps and a persistent completion state.
- Feature-specific guides for Caesar, Diffie-Hellman, and Hash.
- Caesar alphabet visualization to make the shift easier to understand.
- A dedicated shift control with slider and numeric input for the Caesar cipher.
- More explanatory Diffie-Hellman sections for global parameters, key generation, and shared secret computation.
- Side-by-side hash comparison with visual highlighting of differences.
- Expanded localization strings in both English and Portuguese.

## Changed

- Main navigation was reorganized around a dashboard and a responsive side menu.
- The Caesar experience was redesigned with clearer input/output sections and a formula panel.
- The Diffie-Hellman experience was restructured to better explain each step of the exchange.
- The Hash screen was refactored to compare two inputs side by side.
- The app now starts in Portuguese by default.
- App bootstrap now loads local preferences and package metadata.
- The app version was updated from `1.0.0+1` to `1.1.0+1`.

## Fixed

- Diffie-Hellman fields and results now reset correctly when parameters are cleared or invalid.
- Caesar results update automatically when the text, key, or mode changes.
- Hash comparisons stay in sync when either input changes, and empty input states are handled more cleanly.
- Onboarding and in-app guides are persisted locally so they do not appear repeatedly.

## Notes

- The previous beta version was `1.0.0`.
- This release focuses on usability, education, and clearer crypto walkthroughs rather than new algorithms.

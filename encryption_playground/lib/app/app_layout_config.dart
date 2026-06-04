/* this file is the setup for the UI layout, using constraints and enums for
* define the UI details aspects
*/

/// Type of screen layout
enum LayoutType {
  mobile,
  tablet,
  desktop,
}

/// Configurator for layout details
class LayoutConfig {
  static const double mobileMaxWidth = 599;
  static const double tabletMaxWidth = 1023;

  static const double maxContentWidth = 1200;
  static const double minContentWidth = 320;

  static const double maxInputWidth = 600;

  static LayoutType getLayoutType(double width) {
    if (width <= mobileMaxWidth) return LayoutType.mobile;
    if (width <= tabletMaxWidth) return LayoutType.tablet;
    return LayoutType.desktop;
  }
}

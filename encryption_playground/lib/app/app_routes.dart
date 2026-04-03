import 'package:flutter/material.dart';
import '../features/home/presentation/pages/about_page.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  
  // Feature Routes
  static const String tryOut = 'try_out';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
  };
}

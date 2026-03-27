import 'package:flutter/material.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';
  
  // Feature Routes
  static const String tryOut = 'try_out';
  static const String about = 'about';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomePage(),
  };
}

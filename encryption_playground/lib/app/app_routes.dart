import 'package:flutter/material.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
      };
}

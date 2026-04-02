import 'package:encryption_playground/features/caesar/presentation/caesar_controller.dart';
import 'package:encryption_playground/features/hash/presentation/hash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/diffie_hellman/presentation/diffie_hellman_controller.dart';
import 'locale_controller.dart';
import 'theme_controller.dart';
import 'app.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CaesarController()),
        ChangeNotifierProvider(create: (context) => DiffieHellmanController()),
        ChangeNotifierProvider(create: (context) => HashController()),
        ChangeNotifierProvider(create: (context) => LocaleController()),
        ChangeNotifierProvider(create: (context) => ThemeController()),
      ],
      child: const App(),
    );
  }
}

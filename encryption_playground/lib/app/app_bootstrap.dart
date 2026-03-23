import 'package:encryption_playground/features/caesar/presentation/ceasar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CeasarController()),
        // Add other providers here
      ],
      child: const App(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/theme/app_colors.dart';


class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({super.key});

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: [

            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 17)),

            /// logo, about project & author social buttons
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Row(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset(
                        'assets/logo_full.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 16),

                      Expanded(
                        child: const Text(
                          'Este projeto foi desenvolvido durante a disciplina de Segurança da Informação, durante o primeiro semestre do ano de 2026, '
                              'com o intuito de demonstrar o funcionamento dos algoritmos de cripografia',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16,),
                        ),
                      ),





                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 17)),

            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: IntrinsicHeight(
                    child: Row(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        /// about the project
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: theme.colorScheme.outlineVariant.withAlpha(38), // ~15% opacity ghost border
                              ),
                              boxShadow: isDark
                                  ? [
                                const BoxShadow(
                                  color: AppColors.cyanGlow,
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                ),
                              ]
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [

                                  Text(
                                    'Sobre o aplicativo',
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  Column(
                                    children: [
                                      _buildInfoRow(context, 'Version', '1.0.0'),
                                      _buildInfoRow(context, 'Developer', 'Rafael Antunes Souza'),
                                      _buildInfoRow(context, 'License', 'MIT'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// author social buttons
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainer,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: theme.colorScheme.outlineVariant.withAlpha(38), // ~15% opacity ghost border
                              ),
                              boxShadow: isDark
                                  ? [
                                const BoxShadow(
                                  color: AppColors.cyanGlow,
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                ),
                              ]
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [

                                  Text(
                                    'Contato',
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 35),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    spacing: 12,
                                    children: [
                                      /// github button
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: (){
                                              _openUrl('https://github.com/rafinha-as-br');
                                            },
                                            child: Row(
                                              spacing: 5,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.link),
                                                Expanded(child: Text('GitHub'))
                                              ],
                                            )
                                        ),
                                      ),

                                      /// linkedIn button
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: (){
                                              _openUrl('https://www.linkedin.com/in/rafael-antunes-souza/');

                                            },
                                            child: Row(
                                              spacing: 5,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.link),
                                                Expanded(child: Text('LinkedIn'))
                                              ],
                                            )
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir $url');
    }
  }
}


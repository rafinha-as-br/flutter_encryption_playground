import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*
* TODO: Place the texts of this page into the internacionalization files
* */

class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({super.key});

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: [

            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 17)),

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
                        child: DefaultContainer(
                          child: Column(
                            children: [

                              Text(
                                'Sobre o projeto',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              const Text(
                                'Este projeto foi desenvolvido durante a disciplina de Segurança da Informação, durante o primeiro semestre do ano de 2026, '
                                    'com o intuito de demonstrar o funcionamento dos algoritmos de cripografia',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16,),
                              )
                            ],
                            )
                        ),
                      )

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
                          child: DefaultContainer(
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
                          )
                          ),
                        ),

                        /// author social buttons
                        Expanded(
                          child: DefaultContainer(
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
                                    child: OutlinedButton.icon(
                                      onPressed: (){
                                        _openUrl('https://github.com/rafinha-as-br');
                                      },
                                      label: Text('GitHub'),
                                      icon: Icon(Icons.link),
                                    )
                                  ),

                                  /// linkedIn button
                                  Expanded(
                                    child: OutlinedButton.icon(
                                      onPressed: (){
                                        _openUrl('https://www.linkedin.com/in/rafael-antunes-souza/');
                                      },
                                      label: Text('LinkedIn'),
                                      icon: Icon(Icons.link),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          )
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
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
              )
          ),
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


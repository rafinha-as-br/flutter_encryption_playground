import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutPageMobile extends StatefulWidget {
  const AboutPageMobile({super.key});

  @override
  State<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [

            /// logo & about project
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/logo_full.png',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),

            SliverToBoxAdapter(
              child: DefaultContainer(
                  child: Column(
                    children: [
                      Text(
                        'Sobre o projeto',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Este projeto foi desenvolvido durante a disciplina de Segurança da Informação, durante o primeiro semestre do ano de 2026, '
                        'com o intuito de demonstrar o funcionamento dos algoritmos de cripografia',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
              ),
            ),

            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 17)),


            /// author social container
            SliverToBoxAdapter(
              child: DefaultContainer(
                  child: Column(
                    children: [
                      Text(
                        'Contato',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /// github button
                          OutlinedButton.icon(
                            onPressed: (){
                              _openUrl('https://github.com/rafinha-as-br');
                            },
                            label: Text('GitHub'),
                            icon: Icon(Icons.link),
                          ),

                          /// linkedIn button
                          OutlinedButton.icon(
                            onPressed: (){
                              _openUrl('https://www.linkedin.com/in/rafael-antunes-souza/');
                            },
                            label: Text('LinkedIn'),
                            icon: Icon(Icons.link),
                          ),

                        ],
                      ),

                    ],
                  )
              ),
            ),

            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 17)),

            /// About the app container
            SliverToBoxAdapter(
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

                    /// project versions & license
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
            )
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

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// logo & context
            Column(
              children: [
                Image.asset(
                  'assets/logo_full.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 32),
                Text(
                  'Encryption Playground',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Este projeto foi desenvolvido durante a disciplina de Segurança da Informação, durante o primeiro semestre do ano de 2026, '
                  'com o intuito de demonstrar o funcionamento dos algoritmos de cripografia',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Divider(color: Theme.of(context).dividerColor,),
                const SizedBox(height: 16),



              ],
            ),

            /// author social buttons
            Column(
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
                    OutlinedButton(
                        onPressed: (){
                          _openUrl('https://github.com/rafinha-as-br');
                        },
                        child: Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.link),
                            Text('GitHub')
                          ],
                        )
                    ),

                    /// linkedIn button
                    OutlinedButton(
                        onPressed: (){
                          _openUrl('https://www.linkedin.com/in/rafael-antunes-souza/');

                        },
                        child: Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.link),
                            Text('LinkedIn')
                          ],
                        )
                    ),

                  ],
                ),
                const SizedBox(height: 16),
                Divider(color: Theme.of(context).dividerColor,),
                const SizedBox(height: 16),
              ],
            ),


            /// author social buttons
            Column(
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

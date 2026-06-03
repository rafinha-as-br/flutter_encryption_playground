import 'package:encryption_playground/features/home/presentation/pages/about_page.dart';
import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// Desktop layout for the [AboutPage] page.
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
        title: Text(AppLocalizations.of(context)!.aboutProjectTitle),
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
                                AppLocalizations.of(context)!.aboutProjectTitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              Text(
                                AppLocalizations.of(context)!.aboutProjectText,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 16,),
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
                                AppLocalizations.of(context)!.aboutApp,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              Column(
                                children: [
                                  _buildInfoRow(context, AppLocalizations.of(context)!.version, '1.0.0'),
                                  _buildInfoRow(context, AppLocalizations.of(context)!.developer, 'Rafael Antunes Souza'),
                                  _buildInfoRow(context, AppLocalizations.of(context)!.license, 'MIT'),
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
                                AppLocalizations.of(context)!.contact,
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


import 'package:encryption_playground/app/theme_controller.dart';
import 'package:encryption_playground/features/home/presentation/pages/about_page.dart';
import 'package:encryption_playground/shared/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/package_info_service.dart';
import '../../../../../l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// Mobile layout for the [AboutPage] page.
class AboutPageMobile extends StatefulWidget {
  const AboutPageMobile({super.key});

  @override
  State<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  @override
  Widget build(BuildContext context) {
    final packageInfoService = PackageInfoService.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.aboutProjectTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [

            /// logo & about project
            SliverToBoxAdapter(
              child: Provider.of<ThemeController>(context).isDarkMode ?
                Image.asset(
                  'assets/dark_logo_full.png',
                  height: 150,
                  fit: BoxFit.contain,
                )
              :
                Image.asset(
                  'assets/light_logo_full.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
            ),

            SliverToBoxAdapter(
              child: DefaultContainer(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.aboutProjectTitle,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.aboutProjectText,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16),
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
                        AppLocalizations.of(context)!.contact,
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
                      AppLocalizations.of(context)!.aboutApp,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// project versions & license
                    Column(
                      children: [
                        _buildInfoRow(context, AppLocalizations.of(context)!.version, packageInfoService.packageInfo.version),
                        _buildInfoRow(context, AppLocalizations.of(context)!.developer, 'Rafael Antunes Souza'),
                        _buildInfoRow(context, AppLocalizations.of(context)!.license, 'MIT'),
                        _buildInfoRow(context, AppLocalizations.of(context)!.sourceCode, 'https://github.com/rafinha-as-br/encryption_playground'),
                        _buildInfoRow(context, packageInfoService.packageInfo.appName, "The educational playground for encryption algorithms")
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

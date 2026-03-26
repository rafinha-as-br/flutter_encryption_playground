import 'package:encryption_playground/features/hash/presentation/hash_controller.dart';
import 'package:encryption_playground/features/hash/presentation/pages/hash_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class HashTryOut extends StatefulWidget {
  const HashTryOut({super.key});

  @override
  State<HashTryOut> createState() => _HashTryOutState();
}

class _HashTryOutState extends State<HashTryOut> {

  final TextEditingController _textAController = TextEditingController();
  final TextEditingController _textBController = TextEditingController();

  final TextEditingController _dartAController = TextEditingController();
  final TextEditingController _dartBController = TextEditingController();

  final TextEditingController _sha1AController = TextEditingController();
  final TextEditingController _sha1BController = TextEditingController();

  final TextEditingController _sha256AController = TextEditingController();
  final TextEditingController _sha256BController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<HashController>(builder: (context, controller, child){
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.hashCodeTryOut),
          actions: [
            IconButton(
                onPressed: (){
                  HashNavigationService.instance.navigatorKey.currentState!.pushNamed('about');
                },
                icon: const Icon(Icons.info_outline)
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            children: [
              _buildCard(
                  title: l10n.inputA,
                  textController: _textAController,
                  dartController: _dartAController,
                  sha1Controller: _sha1AController,
                  sha256Controller: _sha256AController,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _textBController.text = value;

                      _dartAController.text = controller.generateDartHascode(value);
                      _dartBController.text = controller.generateDartHascode(value);

                      _sha1AController.text = controller.generateSha1Hascode(value);
                      _sha1BController.text = controller.generateSha1Hascode(value);

                      _sha256AController.text = controller.generateSha256Hascode(value);
                      _sha256BController.text = controller.generateSha256Hascode(value);

                    }

                  }
              ),

              _buildCard(
                  title: l10n.inputB,
                  textController: _textBController,
                  dartController: _dartBController,
                  sha1Controller: _sha1BController,
                  sha256Controller: _sha256BController,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _dartBController.text = controller.generateDartHascode(value);
                      _sha1BController.text = controller.generateSha1Hascode(value);
                      _sha256BController.text = controller.generateSha256Hascode(value);
                    }


                  }
              )

            ],
          ),
        ),
      );
    });
  }

  Widget _buildCard({
    required String title,
    required TextEditingController textController,
    required TextEditingController dartController,
    required TextEditingController sha1Controller,
    required TextEditingController sha256Controller,
    required void Function(String)? onChanged
  }){
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          spacing: 8,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge,),

            /// input text field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: l10n.enterText,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      showHashInfoDialog(context: context, type: HashType.input);
                    },
                    icon: Icon(Icons.question_mark)
                )
              ],
            ),

            Divider(),

            /// Dart hashcode
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dartController,
                    decoration: InputDecoration(
                      hintText: l10n.dartHashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    showHashInfoDialog(context: context, type: HashType.dart);
                  },
                  icon: Icon(Icons.question_mark)
                )
              ],
            ),
            /// sha-1 hashcode
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sha1Controller,
                    decoration: InputDecoration(
                      hintText: l10n.sha1HashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                    onPressed: (){
                      showHashInfoDialog(context: context, type: HashType.sha1);
                    },
                    icon: Icon(Icons.question_mark)
                )
              ],
            ),
            /// sha256 hashcode
            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: sha256Controller,
                    decoration: InputDecoration(
                      hintText: l10n.sha256HashCode,
                    ),
                    enabled: false,
                  ),
                ),
                IconButton(
                    onPressed: (){
                      showHashInfoDialog(context: context, type: HashType.sha256);
                    },
                    icon: Icon(Icons.question_mark)
                )

              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showHashInfoDialog({
    required BuildContext context,
    required HashType type,
  }) {
    final info = getHashInfo(type);
    final l10n = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        info.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  info.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(l10n.close),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  HashInfo getHashInfo(HashType type) {
    switch (type) {
      case HashType.dart:
        return const HashInfo(
          title: 'Dart hashCode',
          description:
          'O hashCode do Dart é um identificador numérico usado internamente '
              'para estruturas como Map e Set. Ele NÃO é criptograficamente seguro '
              'e pode variar entre execuções. Serve apenas para comparação rápida.',
        );

      case HashType.sha1:
        return const HashInfo(
          title: 'SHA-1',
          description:
          'SHA-1 é um algoritmo de hash criptográfico que gera um valor de 160 bits. '
              'Hoje é considerado inseguro para uso em segurança, pois possui colisões conhecidas. '
              'É útil aqui apenas para fins didáticos.',
        );

      case HashType.sha256:
        return const HashInfo(
          title: 'SHA-256',
          description:
          'SHA-256 é um algoritmo de hash criptográfico da família SHA-2 que gera '
              'um valor de 256 bits. É amplamente utilizado em segurança, blockchain e '
              'armazenamento seguro de dados.',
        );
      case HashType.input:
        return const HashInfo(
            title: 'Input de texto',
            description: 'Coloque uma entrada de dados para gerar os hashcodes, experimente mudar o texto e veja o resultado'
        );

    }
  }



}


class HashInfo {
  final String title;
  final String description;

  const HashInfo({
    required this.title,
    required this.description,
  });
}

enum HashType {
  dart,
  sha1,
  sha256,
  input
}


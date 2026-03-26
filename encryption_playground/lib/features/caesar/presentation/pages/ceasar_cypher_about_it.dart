import 'package:flutter/material.dart';
import 'ceasar_tab.dart';

class CeasarCypherAboutIt extends StatefulWidget {
  const CeasarCypherAboutIt({super.key});

  @override
  State<CeasarCypherAboutIt> createState() => _CeasarCypherAboutItState();
}

class _CeasarCypherAboutItState extends State<CeasarCypherAboutIt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Caesar Cipher algorithm'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            CaesarNavigationService.instance.navigatorKey.currentState?.pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            context,
            title: '📌 O que é',
            content:
                'A Cifra de César é um algoritmo de criptografia simétrica extremamente simples, baseado em substituição.\n\nEla funciona deslocando cada letra do alfabeto por um número fixo de posições.\n\nExemplo (deslocamento de 3):\nA → D\nB → E\nC → F\n...',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🏛️ Origem Histórica',
            content:
                'A cifra leva o nome de Júlio César, que a utilizava para proteger comunicações militares durante o período da República Romana (por volta de 50 a.C.).\n\nEle usava um deslocamento fixo de 3 letras para enviar mensagens aos seus generais.',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '⚙️ Como funciona (conceitualmente)',
            content:
                '• Define-se um número inteiro chamado chave (shift)\n• Para cada letra:\n  - Localiza sua posição no alfabeto\n  - Soma o valor do deslocamento\n  - Aplica módulo 26 (para "dar a volta" no alfabeto)',
          ),
          _buildCodeBlock(
            context,
            'E(x) = (x + k) mod 26\nD(x) = (x - k) mod 26',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🧠 Características Técnicas',
            content:
                '• Tipo: Criptografia simétrica\n• Complexidade: Muito baixa\n• Segurança: Praticamente inexistente\n• Espaço de chaves: Apenas 25 possibilidades',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '⚔️ Uso ao Longo da História',
            content:
                '• Comunicação militar na Roma Antiga\n• Base conceitual para criptografia clássica\n• Muito usada em ensino introdutório de segurança',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🚨 Limitações',
            content:
                '• Vulnerável a análise de frequência\n• Pode ser quebrada por força bruta em segundos\n• Não oferece confidencialidade real hoje',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '📱 Uso Atual',
            content:
                '• Ensino de criptografia\n• Jogos e puzzles\n• Demonstração de conceitos básicos',
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(BuildContext context, String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }
}

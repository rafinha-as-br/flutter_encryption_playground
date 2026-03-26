import 'package:flutter/material.dart';

class HashAboutIt extends StatelessWidget {
  const HashAboutIt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Hash algorithm'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            context,
            title: '📌 O que é',
            content:
                'Uma função hash transforma um dado de entrada de tamanho arbitrário em uma saída de tamanho fixo.',
          ),
          _buildCodeBlock(
            context,
            '"senha123" → a94a8fe5ccb19ba61c4c0873d391e987...',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🏛️ Origem Histórica',
            content:
                'O conceito surgiu dentro da computação, especialmente em estruturas de dados nos anos 1950–1970.\n\nCom o avanço da criptografia, surgiram funções hash criptográficas modernas como:\n• MD5\n• SHA-1\n• SHA-256',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '⚙️ Como funciona (conceitualmente)',
            content:
                '• Recebe uma entrada qualquer\n• Aplica uma série de transformações matemáticas\n• Produz um valor fixo (hash)',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🧠 Propriedades Importantes',
            content:
                'Uma boa função hash deve ter:\n\n• Determinismo: Mesma entrada → mesma saída\n• Rapidez: Computação eficiente\n• Efeito avalanche: Pequena mudança → saída completamente diferente\n• Resistência a colisões: Difícil encontrar duas entradas com mesmo hash',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🛡️ Características Técnicas',
            content:
                '• Tipo: Função unidirecional\n• Não reversível\n• Usada para integridade e verificação',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🌐 Uso ao Longo da História',
            content:
                '• Estruturas de dados (HashMap, HashTable)\n• Armazenamento seguro de senhas\n• Assinaturas digitais',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '📱 Uso Atual',
            content:
                '• Autenticação de usuários\n• Blockchain\n• Verificação de integridade de arquivos\n• Sistemas distribuídos',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🚨 Limitações',
            content:
                '• Colisões são possíveis (dependendo do algoritmo)\n• Algoritmos antigos (MD5, SHA-1) são considerados inseguros',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '⚠️ Observação importante (arquitetural)',
            content:
                'Hash ≠ criptografia reversível\n\n• Criptografia → pode ser revertida com chave\n• Hash → não pode ser revertido (idealmente)',
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

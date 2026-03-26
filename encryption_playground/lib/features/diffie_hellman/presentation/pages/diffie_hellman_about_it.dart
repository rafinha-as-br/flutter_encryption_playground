import 'package:flutter/material.dart';

class DiffieHellmanAboutIt extends StatelessWidget {
  const DiffieHellmanAboutIt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Diffie hellman algorithm'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection(
            context,
            title: '📌 O que é',
            content:
                'O Algoritmo de Diffie-Hellman é um método de troca segura de chaves criptográficas.\n\nEle permite que duas partes criem uma chave secreta compartilhada sem nunca transmiti-la diretamente.',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🏛️ Origem Histórica',
            content:
                'Proposto em 1976 por:\n• Whitfield Diffie\n• Martin Hellman\n\nFoi o primeiro método prático de criptografia de chave pública.',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '💡 Ideia Central',
            content:
                'Resolver o problema:\n"Como duas pessoas podem compartilhar um segredo sem nunca terem se comunicado antes de forma segura?"',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '⚙️ Como funciona (conceitualmente)',
            content:
                '1. Ambas as partes concordam publicamente em:\n   - Um número primo grande (p)\n   - Um gerador (g)\n2. Cada lado escolhe um segredo privado:\n   - A escolhe a\n   - B escolhe b\n3. Calculam valores públicos:',
          ),
          _buildCodeBlock(
            context,
            'A = g^a mod p\nB = g^b mod p',
          ),
          _buildSection(
            context,
            title: '',
            content: '4. Trocam A e B\n5. Calculam a chave compartilhada:',
          ),
          _buildCodeBlock(
            context,
            'chave = B^a mod p = A^b mod p',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🧠 Conceito Matemático',
            content:
                'Baseado no problema do logaritmo discreto.\n\nEsse problema é computacionalmente difícil de resolver, garantindo segurança.',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🛡️ Características Técnicas',
            content:
                '• Tipo: Criptografia de chave pública\n• Objetivo: Troca de chaves, não criptografia direta\n• Segurança: Alta (com parâmetros corretos)\n• Base: Matemática modular',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🌐 Uso ao Longo da História',
            content:
                'Base para protocolos modernos como:\n• TLS/HTTPS\n• VPNs\n• SSH',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '📱 Uso Atual',
            content:
                '• Estabelecimento de conexões seguras na internet\n• Aplicações bancárias\n• Comunicação criptografada',
          ),
          const Divider(),
          _buildSection(
            context,
            title: '🚨 Limitações',
            content:
                '• Vulnerável a ataques Man-in-the-Middle se não autenticado\n• Requer uso com certificados digitais',
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
          if (title.isNotEmpty)
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          if (title.isNotEmpty) const SizedBox(height: 8),
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

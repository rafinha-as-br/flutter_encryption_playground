# Encryption Playground 🔐

[🇺🇸 English](README.md) | [🇧🇷 Português](README-PT.md)

O Encryption Playground é um aplicativo educacional em Flutter projetado para demonstrar conceitos criptográficos fundamentais através de experiências interativas. Ele fornece aos usuários um laboratório prático para experimentar algoritmos de criptografia históricos e modernos.

Para informações técnicas detalhadas sobre como o projeto Flutter está estruturado, consulte o [README do Projeto Flutter](encryption_playground/README-PT.md).

## Motivação do Projeto

Durante uma aula de Segurança de Dados, os alunos foram desafiados a desenvolver uma implementação da Cifra de César em qualquer framework de sua preferência. Durante o desenvolvimento do algoritmo de César, surgiu a ideia de um aplicativo educacional contendo mais algoritmos de criptografia, e então eu desenvolvi este aplicativo simples e pequeno.

## Funcionalidades

### 1. Cifra de César
- **Conteúdo Educacional**: Informações sobre a história e mecânica da cifra de substituição de Júlio César.
- **Simulação Interativa**: Criptografe e descriptografe mensagens usando chaves de deslocamento personalizadas.
- **Feedback em Tempo Real**: Visualização imediata das transformações de caracteres.

### 2. Troca de Chaves Diffie-Hellman
- **Conceito Central**: Demonstração de como duas partes (Usuário A e Usuário B) estabelecem um segredo compartilhado sobre um canal inseguro.
- **Simulação Interativa**:
    - Configuração de parâmetros globais (Gerador e Módulo).
    - Visualização do cálculo e troca de chaves públicas.
    - Verificação da derivação do segredo compartilhado em ambos os lados.

### 3. Funções de Hash
- **Verificação de Integridade**: Comparação de entradas para demonstrar o "Efeito Avalanche" (onde pequenas mudanças na entrada resultam em saídas vastamente diferentes).
- **Comparação de Algoritmos**: Suporte para vários métodos de hash, incluindo:
    - Default Dart HashCode
    - SHA-1
    - SHA-256

### 4. Interface de Usuário e Experiência
- **Temas Dinâmicos**: Implementação completa de Modo Escuro (Primário) e Modo Claro (Secundário) baseada em tokens de design estruturados.
- **Internacionalização**: Alternância perfeita entre Inglês e Português (PT-BR).
- **Design Responsivo**: Navegação limpa baseada em abas otimizada para visualizações móveis e desktop.

## Conceitos Abordados

- Criptografia Simétrica
- Protocolos de Troca de Chaves
- Funções de Hash Unidirecionais
- Efeito Avalanche
- Integridade de Dados vs Confidencialidade

## Como Executar

Você pode acessar o site na Vercel: [https://flutter-encryption-playground.vercel.app/](https://flutter-encryption-playground.vercel.app/).
Ou você pode clonar em seu ambiente remoto e testar em um emulador móvel rodando o código dentro do diretório `encryption_playground`.

## Telas

![image.png](/docs/images/image.png)

![image.png](/docs/images/image%201.png)

![image.png](/docs/images/image%202.png)    

## Melhorias Futuras

- Adição da Cifra de Vigenère
- Mais melhorias serão anunciadas no futuro

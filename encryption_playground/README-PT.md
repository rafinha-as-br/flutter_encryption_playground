# Estrutura do Projeto Flutter - Encryption Playground

[🇺🇸 English](README.md) | [🇧🇷 Português](README-PT.md)

Este diretório contém o código-fonte real do aplicativo Flutter.

## Tecnologias Utilizadas

O projeto aproveita padrões e bibliotecas modernas de desenvolvimento Flutter:

- **Gerenciamento de Estado**: Implementado usando o pacote **Provider** para atualizações reativas eficientes.
- **Arquitetura**: Segue os padrões **Feature-First** (Orientado a Funcionalidades) e **Clean Architecture** (Arquitetura Limpa), separando o código em camadas de Domínio e Apresentação.
- **Lógica de Domínio**: Uso de **Casos de Uso (Use Cases)** para encapsular regras de negócios e algoritmos de criptografia, promovendo testabilidade e reutilização.
- **Internacionalização (i18n)**: Utiliza `flutter_localizations` e arquivos ARB para suporte a vários idiomas.
- **Gerenciamento de Tema**: Configuração centralizada do `ThemeData` consumindo tokens AppColors personalizados para estilo consistente em diferentes modos de brilho.
- **Navegação**: Estruturada usando **Navigator 1.0** com **Serviços de Navegação** com escopo de funcionalidade para desacoplar a interface gráfica da lógica de roteamento.
- **Injeção de Dependência**: Gerenciamento básico de dependências via Provider e injetores de inicialização.
- **Tratamento de Entrada**: Tratamento robusto de teclados de hardware e software com validação de formulário e processamento de texto em tempo real.

## Estrutura do Projeto

A estrutura é altamente modular, seguindo uma abordagem baseada em funcionalidades:

```text
lib/
├── app/                  # Configuração central do aplicativo
│   ├── app.dart          # Widget principal da aplicação
│   ├── app_bootstrap.dart# Inicialização do App 
│   ├── app_injector.dart # Configuração de Injeção de Dependências
│   ├── app_layout_config.dart # Constantes de layout responsivo
│   ├── app_routes.dart   # Definições de rotas
│   ├── locale_controller.dart # Estado de seleção de idioma
│   ├── package_info_service.dart # Informações do pacote do App
│   └── theme_controller.dart  # Estado de seleção de tema
├── features/             # Arquitetura modular baseada em funcionalidades
│   ├── caesar/           # Implementação da Cifra de César
│   ├── diffie_hellman/   # Lógica da simulação de troca de chaves
│   ├── hash/             # Algoritmos de hash e ferramentas de comparação
│   ├── home/             # Navegação raiz e painel principal (dashboard)
│   └── onboarding/       # Fluxo de introdução inicial
├── l10n/                 # Recursos de localização ARB
├── shared/               # Componentes, temas e utilitários compartilhados
│   ├── guide/            # Diretrizes de interface e tipografia
│   ├── responsive/       # Widgets e layouts responsivos
│   ├── theme/            # Tokens de tema, cores e estilos globais
│   └── widgets/          # Componentes de interface reutilizáveis
└── main.dart             # Ponto de entrada da aplicação
```

## Executando o Aplicativo

Para rodar o aplicativo localmente:

1. Certifique-se de que você tem o Flutter instalado e configurado.
2. Navegue até este diretório (`encryption_playground`).
3. Baixe as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o app:
   ```bash
   flutter run
   ```

## Executando Testes

Para executar testes unitários e de widgets:
```bash
flutter test
```

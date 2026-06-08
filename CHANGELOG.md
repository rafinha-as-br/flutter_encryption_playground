# Changelog

Todas as mudancas importantes deste projeto serao documentadas neste arquivo.

## [Unreleased]
- Todas as mudanças foram lançadas na versão 1.1.0.
### Added
### Changed
### Fixed

---

## [1.0.0] - 2026-05-19

### Added
- Cifra de Cesar com formula e troca de modo.
- Diffie-Hellman com geracao e troca de chaves.
- Hash com comparacao entre duas entradas.
- Interface com tema escuro.
---

## [1.1.0] - 2026-06-08
 
### Added
- Dashboard inicial com cartoes para navegar entre cifras, criptografia simetrica, criptografia assimetrica e hash.
- Fluxo de onboarding guiado na primeira abertura, com progresso salvo localmente.
- Guias contextuais nas telas de treino para Caesar, Diffie-Hellman e Hash.
- Nova visualizacao da transformacao do alfabeto na cifra de Cesar.
- Novas secoes de geracao de chaves e calculo do segredo compartilhado para Diffie-Hellman.
- Comparacao visual de hash com destaque das diferencas entre duas entradas.
- Alternancia de tema e idioma diretamente no menu lateral.
- Exibicao da versao do aplicativo no menu lateral.
- Ampliacao das traducoes em portugues e ingles para a nova navegacao e os fluxos didaticos.
- Refinamento do README em ingles.
- Inclusao da documentacao tecnica em ingles e portugues.

### Changed
- Revisada a navegacao principal para uma estrutura com dashboard e menu lateral responsivo.
- Reformulada a experiencia da cifra de Cesar com campo de texto, controle deslizante de deslocamento, formula e troca de modo.
- Reorganizada a experiencia do Diffie-Hellman para ficar mais didatica e responsiva em desktop, tablet e mobile.
- A tela de hash foi refeita para permitir comparacao lado a lado entre duas entradas.
- O idioma padrao foi ajustado para portugues.
- A inicializacao do app passou a carregar preferencias locais e informacoes do pacote.
- O projeto passou de `1.0.0+1` para `1.1.0+1`.
- Novos assets de marca foram adicionados para os temas claro e escuro.

### Fixed
- Limpeza correta dos campos e resultados ao redefinir ou invalidar os parametros do Diffie-Hellman.
- Atualizacao automatica dos resultados da cifra de Cesar ao alterar texto, chave ou modo.
- Sincronizacao da comparacao de hashes ao editar as duas entradas e limpeza dos resultados quando o texto fica vazio.
- Persistencia local do onboarding e dos guias de uso para nao exibir as instrucoes repetidamente.

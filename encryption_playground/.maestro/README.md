# Flows Maestro (Android QA)

Mantido pela skill `jira-qa-executor`. Cada arquivo `.yaml` aqui é um flow
determinístico e reutilizável — não uma exploração pontual. Antes de criar
um flow novo, procure aqui se algum já cobre o cenário.

## Estrutura

```
.maestro/
├── README.md
└── hash/
    └── hash_sha_generation.yaml   ← digitar texto em "Entrada A" e validar
                                       SHA-1/SHA-256 gerados
```

Uma subpasta por feature/suíte do app (`hash/`, `caesar/`, `vigenere/`,
`diffie_hellman/`, etc.), espelhando `lib/features/`.

## Rodar via CLI

```bash
maestro test .maestro/                          # tudo
maestro test .maestro/hash/hash_sha_generation.yaml   # um flow
```

## Problemas de testabilidade conhecidos (não corrigidos por esta skill)

A skill de QA não modifica código de produção — apenas registra. Achados
reais da primeira execução (2026-08-22, issue EP-7):

1. **Cards do Dashboard (`FeatureCard`)**: o texto/label acessível do botão
   "Explore" é sempre literalmente `"Explore"`, sem referência à suíte —
   quem carrega o nome (`"Hashcode"`, `"Criptografia assimétrica"`, etc.) é
   o container pai, como content-desc combinado
   (`"Hashcode\n<descrição>"`). Com 4 cards na tela, `tapOn: "Explore"` é
   ambíguo; o flow usa `below: { text: "Hashcode..." }` como contorno.
   Melhor: dar ao botão em si um label acessível único
   (`"Explore Hashcode"`, `Key('explore_hash')`, etc.).
2. **Diálogo de guia da feature** (`try_out_guide_dialog.dart`): o ícone de
   fechar (X) não tem `content-desc`/label acessível — só o barrier de
   tela cheia é rotulado (`"Dispensar"`), e tocar no centro dele cai
   dentro do próprio card do diálogo em vez de fechar. Hoje só é possível
   fechar via coordenada de tela (`point: "79%,24%"`), o que o próprio
   SKILL.md desaconselha como estratégia primária. Melhor: adicionar
   `tooltip`/`Semantics(label: 'Fechar')` ao IconButton do X.

Nenhum dos dois é um bug funcional — a UI funciona normalmente para um
usuário humano. São lacunas de automação, reportadas aqui e no comentário
da issue correspondente conforme a seção "Testabilidade" do
`jira-qa-executor/SKILL.md`.

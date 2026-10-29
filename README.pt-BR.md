# Brazilian Journal of Biometrics — formato Quarto

[English](README.md) | **Português**

Extensão Quarto para escrever artigos no formato do
[Brazilian Journal of Biometrics](https://biometria.ufla.br/) (BJB). Gera o PDF
com a classe LaTeX oficial da revista (`BJB.cls`): cabeçalho com o logo,
autores com ORCID, caixa de resumo, datas de submissão, cabeçalho/rodapé e
referências no estilo da revista.

## Criar um artigo novo

```bash
quarto use template bonijoao/quarto-bjb
```

O comando pede o nome de uma pasta e cria nela o `.qmd` de exemplo, o
`references.bib` e a extensão. Para renderizar:

```bash
quarto render artigo.qmd
```

## Usar num documento que já existe

```bash
quarto add bonijoao/quarto-bjb
```

e no YAML:

```yaml
format:
  bjb-pdf: default
```

## Campos do YAML

| Campo | Uso |
|---|---|
| `title`, `shorttitle` | Título (o curto é opcional) |
| `author` | `name`, `orcid`, `email`, `corresponding: true`, `affiliations` (`department`, `name`, `city`, `region`, `country`) |
| `abstract`, `keywords` | Resumo e palavras-chave (dentro da caixa do resumo) |
| `bibliography` | Arquivo `.bib`; citações com `[@chave]` e `@chave` |
| `manuscript` | Tipo exibido acima do título (padrão `article`) |
| `running-author` | Texto do cabeçalho; padrão: sobrenome do 1º autor + *et al.* |
| `doi`, `volume`, `year`, `elocation` | Preenchidos pela revista |
| `received`, `revised`, `accepted`, `published` | Datas; preenchidas pela revista |

Seções sem número (Agradecimentos, Conflito de interesses, Contribuições)
usam `{.unnumbered}`.

## Requisitos

Uma distribuição LaTeX com `pdflatex` e `biber` (TinyTeX ou MiKTeX). Pacotes
usados pela classe: `fbb`, `sourcesanspro`, `mathastext`, `sansmath`,
`biblatex-nature`, `floatrow`, `mdframed`, `textpos`, `stringstrings`, entre
outros. O TinyTeX instala o que faltar sozinho.

No MiKTeX, se aparecer `auto expansion is only possible with scalable fonts`,
o mapa da fonte Source Sans não está ativo: acrescente
`Map SourceSansThree.map` ao `updmap.cfg` da instalação e rode
`miktex fontmaps configure`.

## Diferença em relação ao template LaTeX oficial

A única alteração na `BJB.cls` é `backend=biber` no lugar de `backend=bibtex`
no `biblatex`, porque o Quarto roda o `biber` com `cite-method: biblatex`. O
estilo das referências (`nature`, citações autor-ano) é o mesmo.

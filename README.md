# Brazilian Journal of Biometrics — Quarto format

**English** | [Português](README.pt-BR.md)

A Quarto extension for writing papers in the format of the
[Brazilian Journal of Biometrics](https://biometria.ufla.br/) (BJB). It builds
the PDF with the journal's official LaTeX class (`BJB.cls`): header with the
journal logo, authors with ORCID, abstract box, submission dates, running
header/footer and references in the journal style.

## Start a new paper

```bash
quarto use template bonijoao/quarto-bjb
```

The command asks for a folder name and creates the example `.qmd`, the
`references.bib` and the extension in it. To render:

```bash
quarto render paper.qmd
```

## Use with an existing document

```bash
quarto add bonijoao/quarto-bjb
```

and in the YAML header:

```yaml
format:
  bjb-pdf: default
```

## YAML fields

| Field | Use |
|---|---|
| `title`, `shorttitle` | Title (the short one is optional) |
| `author` | `name`, `orcid`, `email`, `corresponding: true`, `affiliations` (`department`, `name`, `city`, `region`, `country`) |
| `abstract`, `keywords` | Abstract and keywords (inside the abstract box) |
| `bibliography` | `.bib` file; cite with `[@key]` and `@key` |
| `manuscript` | Type shown above the title (default `article`) |
| `running-author` | Running header text; default: first author's surname + *et al.* |
| `doi`, `volume`, `year`, `elocation` | Filled in by the journal |
| `received`, `revised`, `accepted`, `published` | Dates; filled in by the journal |

Unnumbered sections (Acknowledgments, Conflicts of Interest, Author
Contributions) use `{.unnumbered}`.

## Requirements

A LaTeX distribution with `pdflatex` and `biber` (TinyTeX or MiKTeX). Packages
used by the class include `fbb`, `sourcesanspro`, `mathastext`, `sansmath`,
`biblatex-nature`, `floatrow`, `mdframed`, `textpos` and `stringstrings`.
TinyTeX installs missing packages automatically.

On MiKTeX, if you get `auto expansion is only possible with scalable fonts`,
the Source Sans font map is not enabled: add `Map SourceSansThree.map` to the
installation's `updmap.cfg` and run `miktex fontmaps configure`.

## Differences from the official LaTeX template

The only change to `BJB.cls` is `backend=biber` instead of `backend=bibtex` in
`biblatex`, because Quarto runs `biber` with `cite-method: biblatex`. The
reference style (`nature`, author-year citations) is unchanged.

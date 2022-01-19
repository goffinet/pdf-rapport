## Objectif

A partir d'un document Markdown, obtenir un fichier en PDF ou DOCX de qualité scientifique en passant par Latex avec Pandoc, pour des rapports, pour des travaux de fin d'étude ou pour des supports de cours.

- Liste des :
    - listing de codes,
    - figures,
    - tableaux,
    - références bibliographiques.
- Mermaid.
- Mathjax.
- Notes de bas de page.
- Mise en page:
    - book,
    - report,
    - article.

## Documentation

### External documentation

- [Pandoc Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
- [Crossref filter](https://github.com/lierdakil/pandoc-crossref/blob/master/docs/index.md)
- [Pandoc Defaults file](https://pandoc.org/MANUAL.html#default-files)

## Container

### Github actions

Voir `.github/workflows/main.yml` :

```yaml
name: Build document
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
  workflow_dispatch:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: goffinet/pandoc-latex@master
        with:
          args: "-d defaults_pdf.yml"
      - uses: goffinet/pandoc-latex@master
        with:
          args: "-d defaults_docx.yml"
      - uses: actions/upload-artifact@master
        with:
          name: rapport
          path: output/*
```

### Exécution locale

[Get Docker](https://get.docker.com/)

Voir `Dockerfile`

Container to use `ghcr.io/goffinet/pandoc-latex:master` ([Pandoc Latex container image](https://github.com/goffinet/pandoc-latex))

```bash
docker run -it -v $PWD:/data ghcr.io/goffinet/pandoc-latex:master -d defaults_pdf.yml
docker run -it -v $PWD:/data ghcr.io/goffinet/pandoc-latex:master -d defaults_docx.yml
```

With more command line options:

```bash
docker run -it -v $PWD:/data ghcr.io/goffinet/pandoc-latex:master --pdf-engine=xelatex --toc --citeproc -F mermaid-filter -F pandoc-crossref -V mainfont=\"Arial\" -V geometry:a4paper,margin=2cm -o output/rapport.pdf input/rapport.md
```

## Configuration

### Configuration générale

Check `defaults_pdf.yml` file.

```yaml
ffrom: markdown
to: pdf
output-file: output/rapport.pdf
input-files:
- input/rapport.md
verbosity: INFO
pdf-engine: xelatex
wrap: auto
table-of-contents: true
toc-depth: 4
highlight-style: haddock
citeproc: false
filters:
- mermaid-filter
- pandoc-crossref
- citeproc
```

### Confguration dans l'en-tête du document

```yaml
title: Rapport de travail
subtitle: Rendu intermédiaire
abstract: |
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
keywords: lorem, ipsum
author:
 - "*Rob Knell*"
date: \today
lang: fr-FR
mainfont: Arimo #Arial, Arimo, Time New Roman, Verdana
monofont: FreeMono # Courier New, FreeMono
fontsize: 10pt
papersize: a4
geometry: portrait, headheight=25pt, tmargin=25mm, bmargin=20mm, innermargin=20mm, outermargin=20mm
documentclass: report # book, report, article
toc-title: Table des matières
toc-own-page: false
top-level-division: default # part, chapter, section, or default
numbersections: true
section-divs: false
title-prefix: ""
strip-empty-paragraphs: true
listings: false
bibliography:
- input/bibliography.yaml
csl: parisdiderot
header-includes:
# Multicols
    - \usepackage{multicol}
    - \newcommand{\hideFromPandoc}[1]{#1}
    - \hideFromPandoc{
        \let\Begin\begin
        \let\End\end}
# Define tiny codeblocks
    - \usepackage{framed}
    - \colorlet{shadecolor}{white}
    - \renewenvironment{Shaded} {\begin{snugshade}\normalsize} {\end{snugshade}}
# Links color
    - \usepackage{hyperref}
    - \hypersetup{colorlinks=true,linkcolor=black,urlcolor=blue}
---
```

### Bibliographie

- Fichier bibiliography.yaml
- Fichier parisdiderot.csl

```yaml
references:
- type: article-journal
  id: WatsonCrick1953
  author:
  - family: Watson
    given: J. D.
  - family: Crick
    given: F. H. C.
  issued:
    date-parts:
    - - 1953
      - 4
      - 25
  title: 'Molecular structure of nucleic acids: a structure for deoxyribose
    nucleic acid'
  title-short: Molecular structure of nucleic acids
  container-title: Nature
  volume: 171
  issue: 4356
  page: 737-738
  DOI: 10.1038/171737a0
  URL: http://www.nature.com/nature/journal/v171/n4356/abs/171737a0.html
  language: en-GB
- type: webpage
  id: cisco1
  author:
  - family: Goffinet
    given: F.-E.
  issued: 2021
  title: Chiffement des mots de passes locaux en Cisco IOS
  url: https://cisco.goffinet.org/ccna/gestion-infrastructure/chiffrement-des-mots-de-passes-locaux-cisco-ios/
  accessed: 2021/09/24
...
```

## Fonts

Dans le conteneur.

```
Andale Mono
Arial
Arial Black
Arimo
Comic Sans MS
Courier New
Cousine
Fixed
FreeMono
FreeSans
FreeSerif
Georgia
Impact
Noto Music
Noto Nastaliq Urdu
Noto Sans
Noto Sans ...
Open Sans
Terminus
Times New Roman
Tinos
Trebuchet MS
Verdana
Webdings
```

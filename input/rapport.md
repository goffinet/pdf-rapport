---
title: Rapport de travail
subtitle: Rendu intermédiaire
abstract: |
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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

# Introduction

A partir d'un document Markdown, obtenir un fichier en PDF ou DOCX de qualité scientifique en passant par Latex avec Pandoc, pour des rapports, des travaux de fin d'étude ou des supports de cours.

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

## Citation

Blah blah [@WatsonCrick1953].

Blah blah @cisco1

Blah blah[^reference1]

[^reference1]: @cisco1

## Math

Lorem ipsum dolor sit amet,

$f(x)=\sum_{n=0}^\infty\frac{f^{(n)}(a)}{n!}(x-a)^n$

consectetur adipiscing elit.

### Superscript/Subscript

H~2~O is a liquid.  2^10^ is 1024.

## Multi columns

\Begin{multicols}{2}

### H3 - a

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### H3 - b

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

### H3 - c

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

\End{multicols}

## Diagramme Mermaid

Diagramme Mermaid[^1].

~~~{.mermaid}
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#FFFFFF', 'nodeBorder': '#000000', 'clusterBorder': '#000000'}}}%%
graph TD
subgraph Central_Management_Sites
  Central_Mgmt_Site["Redundant Central Management DCs"]
  end
  subgraph Site_A
    Datacenter_A -.- Central_Mgmt_Site
    end
  subgraph Site_B
    Datacenter_B -.- Central_Mgmt_Site
    end
  subgraph Site_C
    Datacenter_C -.- Central_Mgmt_Site
    end
~~~

[^1]: [Mermaid lets you create diagrams and visualizations using text and code.](https://mermaid-js.github.io/mermaid/#/)

# Examples

## Skeleton of a dog

>Skeleton of a dog [^2].

**A** – Cervical or Neck Bones (7 in number). **B** – Dorsal or Thoracic Bones (13 in number, each bearing a rib). **C** – Lumbar Bones (7 in number). **D** – Sacral Bones (3 in number). **E** – Caudal or Tail Bones (20 to 23 in number).

![Skeleton of a dog](./input/images/640px-Skeleton_of_a_dog_diagram.svg.png)

- 1 – Cranium, or Skull.
- 2 – Maxilla.
- 3 – Mandible, or Lower jaw .
- 4 – Atlas.
- 5 – Axis.
- 6 – Scapula, or Shoulder-blade.
- 7 – Spine of scapula.
- 8 – Humerus.
- 9 – Radius.
- 10 – Ulna.
- 11 – Phalanges.
- 12 – Metacarpal Bones.
- 13 – Carpal Bones or Wrist-bones.
- 14 – Sternum, or Breast-bone.
- 15 – Cartilaginous part of rib.
- 16 – Ribs (13 in number).
- 17 – Phalanges.
- 18 – Metatarsal Bones.
- 19 – Tarsal Bones.
- 20 – Calcaneus (os calcu).
- 21 – Fibula.
- 22 – Tibia.
- 23 – Patella, or Knee-cap.
- 24 – Femur.
- 25 – Ischium.
- 26 – Pelvis, or Hip-bone.

[^2]: [Skeleton of a dog](https://upload.wikimedia.org/wikipedia/commons/e/ed/Skeleton_of_a_dog_diagram.svg)

## Linux skeleton

```{#lst:code1 .bash caption="Bash code"}
root@scw-sad-nash:~# tree -L 1 /
/
├── bin -> usr/bin
├── boot
├── data
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib32 -> usr/lib32
├── lib64 -> usr/lib64
├── libx32 -> usr/libx32
├── lost+found
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── snap
├── srv
├── sys
├── tmp
├── usr
└── var

24 directories, 0 files
```

## Python code

```{#lst:python1 .python caption="Python code"}
def find_first_address(address):
    """Find the network address.

    :return: the network address
    :rtype: str
    """
    first_address = self.integer & self.netmask_integer
    return IPAddress(first_address).from_integer(self.version)
```

# Markdown styles

## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Strikethrough~~

The `\newpage` latex tag create a page break.

\newpage

## Lists

### Unordered

- Create a list by starting a line with `-`, or `*`
- Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    - Ac tristique libero volutpat at
    - Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
- Very easy!

### Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar


## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

```{#lst:code2 .haskell caption="Haskell code"}
main :: IO ()
main = putStrLn "Hello World!"
```

## Tables

| Item | Avantages | Incovénient |
| ---- | --------- | ----------- |
| Item 1 | Avantage 1 | Incovénient 1 |
| Item 2 | Avantage 3 | Incovénient 2 |
| Item 3 | Avantage 3 | Incovénient 3 |
| Item 4 | Avantage 4 | Incovénient 4 |

: Table 1 {#tbl:tbl1}

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

: Table 2 {#tbl:tbl2}

Right aligned columns

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

: Table 3 {#tbl:tbl3}

## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica


## Images

![Minion](https://octodex.github.com/images/minion.png)

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"

## Boxes

---

**NOTE**

It works with almost all markdown flavours (the below blank line matters).

---

> **_NOTE:_**  The note content.

# Conclusion

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Liste des figures, tableaux et listings de code

\listoffigures

\listoftables

\listoflistings

# Bibliographie

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a course slide repository for **BIOS 25328** (a bioinformatics/genomics course taught by Hae Kyung Im). The workflow is: original lecture slides exist as PDFs in `pdf-sources/`, and each PDF has been converted into a directory containing extracted markdown content, images, and a structured metadata JSON.

## Repository Structure

Each lecture follows a consistent pattern:
```
pdf-sources/<lecture-name>.pdf          # Original PDF
<lecture-name>/
  <lecture-name>.md                     # Full markdown extraction of slide content
  <lecture-name>_meta.json              # Table of contents with page IDs and bounding boxes
  _page_<N>_<Figure|Picture>_<M>.jpeg  # Images extracted from each page
```

Current lecture folders:
- `L2-Cancer-GWAS copy/` — Cancer GWAS (note: folder name has a space and "copy")
- `L3-Cancer-GWAS-QC-UKBiobank-2025/` — GWAS QC & UK Biobank
- `L4-Multiple-Testing-Correction-2025/` — Multiple Testing Correction
- `L5-Population-Structure-PCA-2025/` — Population Structure/PCA
- `L6-Mixed-Effects-Models-LDSC-2025/` — Mixed Effects Models/LDSC
- `L7-Polygenic-Risk-Scores-2025/` — Polygenic Risk Scores
- `L8-QTL-analysis-GTEx-2026/` — QTL Analysis/GTEx

## Key Conventions

- The `_meta.json` files contain a `table_of_contents` array with `title`, `heading_level`, `page_id`, and `polygon` (bounding box coordinates) for each section header extracted from the PDF.
- Markdown files use `![](_page_N_Figure_M.jpeg)` syntax to reference extracted images.
- QMD files (Quarto revealjs) exist for L3 and L4; other lectures are still `.md` only.

## Quarto Project Setup

- `_quarto.yml` at the repo root defines the project with `output-dir: docs` and shared revealjs settings.
- `custom.css` (repo root) is applied globally via `_quarto.yml`. It defines `.source-credit`, `.takehome`, and `.columns` styles.
- Individual QMD frontmatters do **not** repeat format settings — they inherit from `_quarto.yml`.
- Rendered HTMLs go to `docs/<lecture-folder>/<lecture>.html` (mirrors source structure).
- To render all lectures: `quarto render`
- To render one: `quarto render L4-.../L4-....qmd`

### Using `.source-credit` in slides

```markdown
::: {.source-credit}
[Source: Author et al. 2023](https://url)
:::
```

## Typical Tasks

When working on this repo, the likely tasks are:
- Converting the extracted `.md` files into Quarto reveal.js slide decks (`.qmd`)
- Editing/correcting lecture content in the `.md` or `.qmd` files
- Adding new lecture PDFs and their extracted content

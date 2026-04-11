# Next Session Prompt — L6 slides (continue editing)

**Goal:** Continue editing and refining `L6-beyond-pcs/L6-beyond-pcs.qmd`

**To render/preview:**
```bash
quarto preview L6-beyond-pcs/L6-beyond-pcs.qmd
```
`custom.css` is at the repo root and referenced via `../custom.css` in the frontmatter.

---

## What was done this session

- Updated date to 2026-04-08
- Changed "Derive the mixed effects model" → "Build intuition for the mixed effects model" in Learning Objectives
- Replaced all speaker notes with narrative summaries pitched at biology students with limited stats/linear algebra background (audience note: most are biologists, only a couple took linear algebra)
- Added notes to 9 slides that previously had none
- Added "Where We Are" transition slide before the LD Score Regression section (animated reveal with `. . .` fragments)
- Draft notes file: `L6-beyond-pcs/L6-slide-notes-draft.md` (can be deleted once notes are finalized)

---

## Current narrative arc

**Recap** — PCs fixed HapMap growth inflation (L5). Two open questions: (1) PCs don't handle cryptic relatedness/family structure; (2) inflated λ ≠ always bias, could be real polygenicity.

**Genomic control** — uniform fix, assumes inflation is constant across genome. Shown with simulated stratification + R code. Framed as quick context/contrast, not the main story.

**Mixed effects models** — main event, answers question 1. $Y = X\beta + u + \epsilon$, $u \sim N(0, \sigma_g^2 \cdot K)$. Built from scratch with 4-individual (2 AFR + 2 EUR) example. GRM shown with HapMap trios. EMMAX vs PCs. Closes with combination strategy vs pure mixed effects trade-off.

**"Where We Are" transition slide** — recaps mixed effects takeaway, restates open question 2, previews LDSC.

**LD Score Regression** — opens with "Two Causes of Inflation" (answers question 2). LD scores → LDSC equation → schizophrenia payoff (λ=1.61 but intercept=1.07). Closes with genetic correlation + assortative mating caveat.

---

## Things to continue

- Preview and verify layout in browser:
  - `r-stack` colored box on the Checkpoint slide
  - Nested `array` phantom-row layout on "Deriving K — Setting Up the Variance"
  - "Where We Are" transition slide animated reveals
- Consider adding `.takehome` boxes to key slides (e.g., LDSC equation slide)
- Check the Z-score/chi-square conversion slides (currently after genomic control) — do they flow well or feel like a detour before LDSC?
- Consider whether the genomic control section has too many figures (3 figures) for a "quick contrast" role
- `L6-slide-notes-draft.md` can be deleted once speaker notes are finalized

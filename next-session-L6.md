# Next Session Prompt — L6 slides (continue editing)

**Goal:** Continue editing and refining `L6-beyond-pcs/L6-beyond-pcs.qmd`

**To render/preview:**
```bash
quarto preview L6-beyond-pcs/L6-beyond-pcs.qmd
```
`custom.css` is copied locally to `L6-beyond-pcs/custom.css` for preview (gitignored). If you edit `custom.css` at the repo root, re-copy it.

---

## Current narrative arc

**Recap** — PCs fixed HapMap growth inflation (L5). Two open questions: (1) PCs don't handle cryptic relatedness/family structure; (2) inflated λ ≠ always bias, could be real polygenicity.

**Genomic control** — uniform fix, assumes inflation is constant across genome. Shown with simulated stratification + R code. Framed as quick context/contrast, not the main story.

**Mixed effects models** — main event, answers question 1. $Y = X\beta + u + \epsilon$, $u \sim N(0, \sigma_g^2 K)$. Built from scratch with 4-individual (2 AFR + 2 EUR) example. GRM shown with HapMap trios. EMMAX vs PCs. Closes with combination strategy vs pure mixed effects trade-off.

**LD Score Regression** — opens with "Two Causes of Inflation" (answers question 2). LD scores → LDSC equation → schizophrenia payoff (λ=1.61 but intercept=1.07). Closes with genetic correlation + assortative mating caveat.

---

## Things to continue

- Review all slides for clarity, layout, and content accuracy
- Check speaker notes are complete and useful
- Consider adding `.takehome` boxes to key slides (e.g., LDSC equation slide, combination strategy slide)
- The Z-score/chi-square conversion slides (currently after genomic control) — check if they flow well or feel like a detour
- Consider whether the genomic control section has too many figures (3 figures + R code) for a "quick contrast" role

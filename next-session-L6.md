# Next Session Prompt — L6 slides (continue editing)

**Goal:** Continue editing and refining `L6-beyond-pcs/L6-beyond-pcs.qmd`

**To render/preview:**
```bash
quarto preview L6-beyond-pcs/L6-beyond-pcs.qmd
```
`custom.css` is at the repo root and referenced via `../custom.css` in the frontmatter.

---

## What was done this session

- Added "Recall the Regression Approach to GWAS" slide (plain $Y = X\beta + \epsilon$) before the mixed effects model slide
- Renamed mixed effects slide to "Extending the Regression Model with a Random Effect"
- Split the checkpoint slide into: (1) question with equations + animated reveal of $Y \sim N(X\beta, \sigma_g^2 \cdot \mathbf{K} + \sigma_e^2 \cdot \mathbf{I})$ using `r-stack` colored box, and (2) full-slide background image
- Renamed "Let's Compute a Population Structure Example" → "Setup: K for 4 Individuals, 2 Populations"
- Added 4 step-by-step K derivation slides (Setting Up the Variance, Expanding the Outer Product, Taking Expectations, Final Result) after the setup slide
- Deleted the old summary "Deriving K for 2 EUR + 2 AFR Individuals" slide (now redundant)
- On the "Setting Up the Variance" slide: used nested `array` with phantom rows to position the transposed u vector at the top-right of the column vector

---

## Current narrative arc

**Recap** — PCs fixed HapMap growth inflation (L5). Two open questions: (1) PCs don't handle cryptic relatedness/family structure; (2) inflated λ ≠ always bias, could be real polygenicity.

**Genomic control** — uniform fix, assumes inflation is constant across genome. Shown with simulated stratification + R code. Framed as quick context/contrast, not the main story.

**Mixed effects models** — main event, answers question 1. $Y = X\beta + u + \epsilon$, $u \sim N(0, \sigma_g^2 \cdot K)$. Built from scratch with 4-individual (2 AFR + 2 EUR) example. GRM shown with HapMap trios. EMMAX vs PCs. Closes with combination strategy vs pure mixed effects trade-off.

**LD Score Regression** — opens with "Two Causes of Inflation" (answers question 2). LD scores → LDSC equation → schizophrenia payoff (λ=1.61 but intercept=1.07). Closes with genetic correlation + assortative mating caveat.

---

## Things to continue

- Review all slides for clarity, layout, and content accuracy
- Check speaker notes are complete and useful
- Consider adding `.takehome` boxes to key slides (e.g., LDSC equation slide, combination strategy slide)
- The Z-score/chi-square conversion slides (currently after genomic control) — check if they flow well or feel like a detour
- Consider whether the genomic control section has too many figures (3 figures + R code) for a "quick contrast" role
- Preview and check the `r-stack` colored box on the checkpoint slide renders correctly
- Check the nested `array` phantom-row layout on "Deriving K — Setting Up the Variance" looks right in the browser

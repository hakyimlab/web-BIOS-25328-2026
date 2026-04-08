# Next Session Prompt — L6 Slides (narrative reorg)

**Goal:** Reorder slides in L5 and L6 for better narrative flow (problem-first approach)

**Current state:**
- Both QMDs fully created and rendering cleanly
- L5: `L5-Population-Structure-PCA-2026/L5-Population-Structure-PCA-2026.qmd`
- L6: `L6-Mixed-Effects-Models-LDSC-2025/L6-Mixed-Effects-Models-LDSC-2025.qmd`

**To render:**
```
quarto render L5-Population-Structure-PCA-2026/L5-Population-Structure-PCA-2026.qmd
quarto render L6-Mixed-Effects-Models-LDSC-2025/L6-Mixed-Effects-Models-LDSC-2025.qmd
```

---

## Agreed reorder: Option A (problem-first)

### L5 target order
1. Genotype matrix
2. **Population structure bias problem first** (spurious association diagram — currently slide ~5)
3. HapMap growth example: inflation confirmed (p-value histogram, QQ plot — currently near end)
4. Four correction methods (student now wants them)
5. Novembre figure as demonstration PCA captures what's needed (currently slide 2)
6. SVD math explains why PCA works
7. Matrix algebra → OLS derivation
8. HWE, heritability as appendix

### L6 target order
1. Recap
2. **"Two causes of inflation" slide early** — this is the central claim of the lecture (currently slide ~25, mid-lecture after mixed models)
3. Genomic control as the straw man: can't distinguish the two causes
4. Mixed effects model as principled correction
5. LDSC resolves the ambiguity (slope = polygenicity, intercept = confounding)
6. Genetic correlation as payoff

### Minimum viable fix for L6 (if full reorder is too much)
Move the "Inflation of Test Statistics: Two Causes" slide (currently slide 25) to immediately after the recap/objectives — before genomic control. This single move makes the rest of the lecture read as answers to a question already posed.

---

## Key narrative insight to preserve
Schizophrenia λ=1.61 looks alarming but LDSC intercept is only 1.07 — most inflation is real polygenicity, not confounding. Genomic control would have over-corrected and destroyed true signal. This is the payoff example for both the LDSC section and the whole two-lecture arc.

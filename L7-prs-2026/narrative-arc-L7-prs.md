# Narrative Arc: L7 Polygenic Risk Scores

**The central question: Can we predict disease risk from DNA?**

The lecture builds from model → problem → solution → application → limitation → ethics.

## 1. The Model (slides 1–4)

Starting point is the polygenic additive model — a natural continuation from L6, which introduced mixed effects models for population structure correction (EMMAX). Here the same equation is reframed: instead of asking "is this SNP associated?", we ask "can we predict Y from all SNPs at once?"

## 2. The Problem (slides 4–7)

Fitting millions of SNPs simultaneously is impossible — too many parameters, too few observations. The course has already touched on this when discussing multiple testing correction (L4). The solution connects back directly to L6's mixed effects / EMMAX framework: treat βs as random effects, collapsing millions of parameters down to one variance.

## 3. The Methods (slides 8–18)

Regularization — ridge, LASSO, elastic net, BSLMM — are introduced as tools that trade off sparsity vs. polygenicity. This section also introduces the L1/L2 norm distinction as a brief pedagogical aside. Simple GWAS-based PRS (use summary stats, no individual-level data) is positioned as the practical workhorse.

## 4. Clinical Utility (slides 19–24)

Does it actually work? Height prediction, CAD, T2D, breast cancer — PRS is predictive but distributions overlap substantially. Combining PRS with family history helps. The deep learning detour (CNN vs. linear) and the AlphaGenome slide add perspective on where the field is heading — sequence → expression models are exciting but haven't yet beaten simple PRS for complex traits.

## 5. The Equity Problem (slides 25–31)

PRS trained mostly on Europeans degrades for everyone else. This connects to L5 (population structure, ancestry) — the same LD and allele frequency differences that PCA captures are precisely why PRS doesn't transfer across ancestries.

## 6. Ethics (slides 32–36)

Commercial embryo screening takes PRS from research to real-world stakes — closing with a question students can debate: is this medicine or eugenics?

---

## Connection to Previous Lectures

- **L4** (multiple testing): why you can't just fit millions of SNPs — the degrees-of-freedom problem
- **L5** (PCA/population structure): ancestry differences explain PRS portability failures
- **L6** (mixed effects/LDSC): EMMAX's random effect *u* is literally the polygenic score — slide 9 makes this explicit

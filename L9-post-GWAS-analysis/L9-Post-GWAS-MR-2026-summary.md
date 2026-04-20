# L9 Summary: Gene Level Association Tests and Mendelian Randomization

**Hae Kyung Im, PhD · BIOS 25328 · April 20, 2026**

---

## Overview

This lecture covers three complementary post-GWAS methods that move from finding associated loci to understanding the biological mechanisms and causal relationships underlying complex traits: **TWAS** (Transcriptome-Wide Association Study), **Colocalization**, and **Mendelian Randomization (MR)**.

---

## Part 1: From GWAS Loci to Genes

### Why Post-GWAS Analysis is Needed

- ~90% of GWAS catalog variants are non-coding, making interpretation difficult.
- GWAS identifies *loci*, not genes or mechanisms.
- The central question: **which gene should we target for therapy?**

### The Biology: Gene Regulation Connects Variants to Traits

- Genetic variants can influence complex traits by altering **protein levels** (Albert & Kruglyak 2015).
- **Splicing** (sQTLs) and **total mRNA expression** (eQTLs) are primary links between genetic variation and disease (Li et al. 2016).
- **eQTLs** (Expression Quantitative Trait Loci) are genetic variants that associate with gene expression levels; the dose-response pattern provides evidence of causal links.

### Naive Approach: Find eGene of Top SNP

- Simple strategy: take the top GWAS SNP and look up its eGene in GTEx.
- **Problem:** LD contamination — the top SNP may be in LD with another causal variant driving expression of a *different* gene.
- Fine-mapping (e.g., SusieR) can reveal that the posterior inclusion probability is concentrated at a different SNP than the GWAS lead variant, pointing to a different gene.

### TWAS / Association Approach

**Core idea:** Instead of measuring gene expression directly (expensive, inaccessible tissues, reverse causality), use **genetic predictors** of gene expression trained in reference datasets (e.g., GTEx).

**PrediXcan** (Gamazon et al. 2015; Gusev et al. 2016):
1. Train tissue-specific gene expression prediction models using reference genotype + transcriptome data (sparse models: elastic net performs better than BSLMM).
2. Impute predicted expression into GWAS cohort (or use summary statistics via S-PrediXcan).
3. Test association between predicted expression and trait.

**Why direct expression measurement fails:**
- RNA-seq is expensive; many tissues are inaccessible (brain, pancreas).
- Reverse causality: differential expression can be a consequence, not cause, of disease.

**Advantages of gene-level associations:**
- Reduced multiple testing burden (10⁶ SNPs → ~10⁴ genes).
- Better functional annotation of genes vs. SNPs.
- Validation possible in model organisms.
- Direction of effects informs on protective/deleterious gene knockdown.
- More direct prioritization of drug targets.

**Limitation — LD Contamination:**
- A gene's predicted expression is based on multiple SNPs; if a nearby gene shares LD-tagging SNPs, both may appear significant even if only one is causal.
- Mitigation: use fine-mapped (sparse) expression predictors.

### Colocalization

**Question:** Do the GWAS trait signal and the eQTL signal share the same causal variant, or are they driven by two distinct variants in LD?

- If they colocalize → strong evidence the eQTL gene mediates the trait association.
- Tools: coloc, SusieR-based colocalization.

**Limitations:**
- Very sensitive to LD reference panel quality (e.g., GIANT vs. UKB height results differ dramatically).
- Colocalization methods are **conservative** — real signals may be dismissed if LD structure is noisy.

**Recommendation for Post-GWAS Analysis:**
1. Start with TWAS/association method to generate candidate causal genes.
2. Use sparse expression predictors (elastic net > BSLMM; fine-mapped predictors even better).
3. Filter with colocalization to remove LD-contaminated associations.
4. Be aware that conservative colocalization may discard true signals.
5. Advocate for studies to share LD matrices alongside GWAS summary statistics.

---

## Part 2: Mendelian Randomization

### Motivation

Observational studies suffer from:
- **Confounding** — shared causes of exposure and outcome.
- **Reverse causation** — the outcome affects the exposure, not vice versa.

**Key insight:** Correlation is not causation.

### What is MR?

Mendelian Randomization uses **genetic variants as instrumental variables (IVs)** to estimate the causal effect of a modifiable exposure (e.g., HDL cholesterol, BMI, smoking) on a disease outcome.

Analogous to a **randomized controlled trial** but using "nature's randomization" at meiosis (Burgess et al. BMJ 2012).

### Three Core Assumptions

1. **Relevance:** The IV is associated with the exposure.
2. **Independence:** The IV is not associated with confounders.
3. **Exclusion restriction:** The IV affects the outcome *only* through the exposure (no direct pathway = no horizontal pleiotropy).

### Key Violation: Pleiotropy

- **Vertical pleiotropy** (mediated pleiotropy): acceptable — IV affects exposure which affects outcome via a chain.
- **Horizontal pleiotropy**: IV affects the outcome through a pathway *independent* of the exposure → violates assumption 3.

**Case study:** HDL cholesterol ("good cholesterol") — MR failed to show a causal protective effect on myocardial infarction, contradicting observational evidence. HDL-raising drugs subsequently failed in clinical trials, validating the MR result (Voight et al. Lancet 2012).

### Statistical Framework

**Single-instrument estimate:**

$$\hat{\beta} = \frac{\hat{\delta}}{\hat{\gamma}}$$

where γ = genetic effect on exposure, δ = genetic effect on outcome.

**Multiple instruments:**
- Weighted median estimator
- MR-Egger regression — detects and corrects for directional pleiotropy; the intercept tests the exclusion restriction (Bowden et al. IJE 2015).
- IVW (Inverse Variance Weighted) — assumes no pleiotropy on average.

### MR-BASE

Web application for performing MR analyses across thousands of GWAS datasets, supporting multiple MR methods.

### Summary of MR

- MR provides evidence of **putative causal relations** using genetic variants as natural experiments.
- Less susceptible to confounding and reverse causation than observational studies.
- Results depend on **assumptions** that must be critically assessed.
- Interpret alongside other evidence types (RCT, biological plausibility) for clinical decisions.

---

## Key References

- Albert & Kruglyak (2015). *Nature Reviews Genetics* — regulatory variation in complex traits.
- Li et al. (2016). *Science* — RNA splicing as a link between genetic variation and disease.
- Gamazon et al. (2015). *Nature Genetics* — PrediXcan.
- Gusev et al. (2016). *Nature Genetics* — integrative TWAS.
- Voight et al. (2012). *The Lancet* — HDL MR study.
- Bowden et al. (2015). *IJE* — MR-Egger regression.
- Davies, Holmes & Davey Smith (2018). *BMJ* — guide to reading MR studies.
- GTEx Consortium (2020). *Science* — atlas of genetic regulatory effects.

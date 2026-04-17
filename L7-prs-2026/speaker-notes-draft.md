# Speaker Notes Draft — L7 Polygenic Risk Scores

*One block per slide, in order. `[NEW]` = no current notes. `[REVISED]` = rewritten or extended.*

---

## Learning Objectives `[NEW]`

This lecture picks up where L6 left off — same polygenic model, different question. Before: is this SNP associated? Now: can we predict Y for a new individual?

---

## Polygenic Additive Model `[REVISED]`

Same equation from L6. X_k is genotype at position k, β_k is its effect size. ε absorbs everything not in the sum — environment, measurement error, model misfit. Covariates can be added.

---

## Estimating Parameters of the Polygenic Additive Model `[REVISED]`

With 1M SNPs and 10K people, fitting OLS is not possible — more parameters than observations, will be badly overfitting. Three slides give three different solutions.

---

## Rule of Thumb `[NEW]`

Ten data points per parameter, minimum five. With a million SNPs, that's ten million people. Biobanks are getting there, but not for most studies. So we need smarter approaches.

---

## Solution: Reduce Parameters via Random Effects `[REVISED]`

Instead of estimating each β separately, assume they're drawn from the same normal distribution and estimate just one thing: the variance. Down from a million parameters to one.

---

## Mixed Effects Modeling `[NEW]`

Same model, now written as a mixed effects model. Fixed effects handle covariates; random effects capture the genetic background. This is the same framework from L6, just repurposed for prediction.

---

## Connection to EMMAX `[REVISED]`

EMMAX's random effect u has the same mathematical form as a polygenic score — both reduce to Σ X_k β_k with β_k ~ N(0, σ²_β), giving covariance σ²K. EMMAX uses it as a nuisance term to absorb genetic background; here we repurpose the same structure for prediction. One important difference: in the random effects model the βs are treated as true unknowns drawn from a distribution; in PRS they are estimates from GWAS data, carrying noise and uncertainty.

---

## L2 Norm of a Vector `[NEW]`

L1 and L2 norms define the two main types of regularization penalties used in PRS methods.

---

## In a GWAS We Minimize the L2 Norm of the Error `[REVISED]`

Standard OLS minimizes the squared L2 norm of the residuals. That's the loss. Regularization adds a second term penalizing the β vector itself.

---

## Which One Is the L1 Norm? `[REVISED]`

Option 2 is correct — absolute values ensure non-negativity. The L1 norm is not differentiable at zero, which is exactly why LASSO produces exact zeros and sparse solutions.

---

## Simple Polygenic Risk Score `[REVISED]`

The ISC 2009 schizophrenia paper was the first to show that summing thousands of sub-threshold SNPs — each individually non-significant — improved prediction. A surprise at the time. No individual-level data needed, just GWAS summary stats.

---

## Tricks to Deal with Too Many Parameters `[REVISED]`

Three approaches in increasing complexity: (1) random effects — EMMAX/BLUP; (2) marginal GWAS effects — simple PRS; (3) penalized regression — ridge, LASSO, elastic net. Each trades off in a different way.

---

## BLUP / Ridge Regression `[REVISED]`

Ridge adds a λ₂||β||₂ penalty. This shrinks all effect sizes toward zero proportionally, preventing any single SNP from dominating. The solution is mathematically equivalent to BLUP from animal breeding.

---

## LASSO and Elastic Net `[REVISED]`

LASSO's L1 penalty produces exact zeros — many βs are dropped entirely. Good for sparse architectures. Elastic net mixes L1 and L2, giving less sparse solutions. Neither fits the fully polygenic architecture well.

---

## Whole-Genome Prediction: BSLMM `[REVISED]`

BSLMM fits both components at once: a dense polygenic term for the background and a sparse large-effect term. The data determine how much weight each gets. Other whole-genome methods: multiBLUP, OmicKriging.

---

## Advantages of Simple Polygenic Scores `[NEW]`

GWAS summary statistics are publicly available from thousands of studies. Individual-level data — needed for ridge, LASSO, BSLMM — is rarely shared. That's the practical edge of simple PRS.

---

## Improving PRS with LD Information `[REVISED]`

Simple GWAS-based PRS counts correlated SNPs multiple times. These methods use LD reference panels to account for this correlation. PRSice prunes and thresholds; LDPred, PRS-CS, and S-BayesR reweight using the LD structure.

---

## Importance of Good LD Reference Data `[NEW]`

These methods are only as good as their LD reference. Ideally the reference comes from the same study population. Summary stats are widely shared; the accompanying LD matrices are not. That gap matters.

---

## What About Deep Learning? `[REVISED]`

For complex polygenic traits, CNNs have not consistently beaten simple linear PRS. DL has found its niche in sequence-to-function prediction, not in polygenic scoring.

---

## DNA Sequencing to Gene Expression `[REVISED]`

AlphaGenome (Enformer lineage) predicts gene expression from raw DNA sequence using transformers + CNNs. 250M parameters — tiny by LLM standards, but already more than enough for this task. Promising for regulatory variant interpretation, less so for complex trait PRS, for now.

---

## Genomic Prediction of Height in UK Biobank `[REVISED]`

Height is heritable, objective, and easy to validate — a good test case. Biobank-scale data allows accurate height prediction from common variants. The predictions here used a method similar to BSLMM.

---

## Prevalence of Coronary Artery Disease Increases with PRS `[REVISED]`

CAD risk rises monotonically across PRS deciles. The high-risk tail is clinically meaningful — comparable in magnitude to familial hypercholesterolemia, which already triggers early intervention.

---

## Prevalence of Type 2 Diabetes Increases with PRS `[REVISED]`

Same monotonic pattern as CAD. The question is whether the spread is enough to be clinically actionable — most high-PRS individuals will not develop T2D.

---

## PRS Differences Between Cases and Controls Are Modest `[REVISED]`

Yes, cases have higher PRS on average — but the distributions overlap massively. Prediction is probabilistic, not deterministic. Most individuals in the high-PRS tail will not develop T2D.

---

## Breast Cancer: PRS Is Predictive of Risk `[REVISED]`

Odds ratio for breast cancer rises across PRS percentiles. Note the log scale — the top percentile has roughly 3× the risk of the bottom. That's clinically useful for deciding who gets enhanced surveillance.

---

## PRS + Family History Improves Risk Prediction `[REVISED]`

Family history captures rare variants and shared environment that PRS misses. Combining the two improves stratification across all four cancer types. But neither works equitably across ancestries — PRS performance degrades substantially for non-European populations.

---

## Portability of Prediction Across Ancestries `[REVISED]`

PRS trained on Europeans underperforms in everyone else. Three reasons: LD proxies differ, allele frequencies differ, and not all causal variants are shared. This is the same population structure from L5 — now with clinical consequences.

---

## Ancestry Composition of Current GWAS `[REVISED]`

Over 80% of GWAS participants are European — less than 15% of the world population. The training data bias directly produces the performance bias.

---

## Allele Frequency and LD Differ Across Ancestries `[REVISED]`

AFR populations have higher diversity and shorter haplotype blocks than EUR. EUR-derived LD proxies often don't tag the same causal variants in AFR samples. The proxy problem compounds the allele frequency problem.

---

## PRS Does Not Transfer Well Across Populations `[REVISED]`

Performance normalized to EUR. In AFR individuals it drops to ~25%. This isn't a minor technical issue — deploying current PRS in a diverse clinical population would widen health disparities.

---

## Performance Decays with Genetic Distance to Training Population `[REVISED]`

Performance degrades continuously with genetic distance, both across discrete ancestry groups and within admixed individuals. It's not a step function — it scales with distance from the training population.

---

## Individual-Level PGS Accuracy Across the Genetic Ancestry Continuum `[REVISED]`

The correlation between genetic distance to the training population and individual PGS accuracy is -0.88 to -0.35 across groups. The problem persists even within ancestry categories.

---

## Investments in More Diverse Samples Are Being Made `[NEW]`

All of Us, H3Africa, GenomeAsia, PAGE — large diverse cohorts recruiting now. Multi-ancestry GWAS and transfer-learning PRS methods are active research areas. The field is aware of the problem and moving on it.

---

## Screening Human Embryos for Polygenic Traits Has Limited Utility `[REVISED]`

PRS entered the clinic before the modeling was done. Karavani et al. ran the numbers: excluding embryos with very high PRS has minimal impact; selecting the single lowest-PRS embryo matters more — but only when there are enough viable embryos to choose from.

---

## Embryo Selection: Active Area of Research `[REVISED]`

Adding rare high-penetrance variants (e.g., BRCA1) to PRS amplifies predicted differences between siblings. A BRCA1 carrier couple could see a 15-fold predicted odds ratio difference across embryos, versus 4.5-fold for BRCA1 alone and 3-fold for PRS alone.

---

## Orchid Offers Preconception Testing `[REVISED]`

Commercial preimplantation PRS screening is banned in Europe under European Society of Human Genetics guidelines. Legal in the US. Lior Pachter's critique is worth reading — he argues the statistical framing is misleading.

---

## Effect on Schizophrenia Risk Selection `[REVISED]`

The numbers: top 10% of PRS → 1.4× enrichment. Top 1% → 5.4× enrichment. PRS explains ~11% of liability (AUC 0.74). Most people in the top 1% still won't develop schizophrenia. The probabilistic nature cuts both ways.

---

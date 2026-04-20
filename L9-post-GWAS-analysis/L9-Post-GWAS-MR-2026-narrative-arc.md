# Narrative Arc: Gene Level Association Tests and Mendelian Randomization

## The Central Question

GWAS has been enormously successful — thousands of loci associated with hundreds of complex traits. But GWAS is, in a sense, only the beginning. It tells us *where* in the genome to look, but not *what* to do with that information. This lecture answers two of the most pressing post-GWAS questions:

1. **Which gene is the GWAS locus acting through?** (TWAS + Colocalization)
2. **Is the exposure-disease relationship actually causal?** (Mendelian Randomization)

---

## Act I: The Problem with Non-Coding Variants

GWAS variants are overwhelmingly non-coding. They don't change protein structure — so how do they affect disease? The leading hypothesis: they act through **gene regulation** — altering how much of a gene's mRNA is made (eQTLs) or how it's spliced (sQTLs). This gives us a path from variant → expression → disease.

**Tension introduced:** If variants act through expression, can we just look up the top SNP's eGene in GTEx? The answer is no — and understanding why sets up everything else in Part 1.

---

## Act II: The Naive Approach Fails — and Why That Matters

The naive method (look up the eGene of the top GWAS SNP) is intuitive but flawed. Linkage disequilibrium means the GWAS lead SNP may be tagging a variant that actually regulates a *completely different* gene. Fine-mapping reveals the true causal variant often points elsewhere.

**The lesson:** association alone is not enough. We need methods that model the full LD structure and test gene-level effects systematically.

---

## Act III: TWAS — Scaling Up the Association Idea

Instead of one SNP at a time, what if we test all ~20,000 genes? TWAS (specifically PrediXcan) does this by training predictive models of gene expression from reference data (GTEx) and applying them to GWAS summary statistics. The key insight: use *genetic* predictors of expression to avoid reverse causality, reduce cost, and enable tests in inaccessible tissues.

The method is powerful: it reduces multiple testing from millions of SNPs to tens of thousands of genes, and genes have far better functional annotation than SNPs. But TWAS inherits a fundamental problem from the naive approach — **LD contamination**. Nearby genes can be falsely associated simply because their predictors share tagging SNPs.

---

## Act IV: Colocalization — Asking If They Share a Cause

Colocalization methods ask: do the GWAS signal and the eQTL signal for a candidate gene share the same causal variant, or are they driven by two distinct variants that happen to be in LD? Colocalization provides probabilistic evidence that a gene's expression is the actual mechanism.

But colocalization has its own Achilles' heel: it is highly sensitive to the LD reference panel, and methods tend to be **conservative** — real colocalized signals are often discarded. The field needs better LD resources.

**The recommendation emerges:** use TWAS to generate candidates, then apply colocalization to filter — but don't trust colocalization to be the final word.

---

## Act V: Mendelian Randomization — Testing Causality of Exposures

Part 2 shifts from genes to exposures. We've established that gene X might mediate the GWAS signal — but does raising or lowering that gene's product *cause* better or worse disease outcomes? More broadly: does high HDL cholesterol *protect* against heart attack? Does obesity *cause* depression?

Observational studies can't answer this cleanly — confounding and reverse causation always lurk. Enter Mendelian Randomization, which exploits the random assortment of alleles at conception as a natural experiment. Genetic variants associated with the exposure serve as unconfounded proxies.

---

## Act VI: MR's Power and Its Limits

MR is compelling, but its validity rests on three assumptions — and the most easily violated is **no horizontal pleiotropy**: the genetic instrument must affect the outcome *only* through the exposure. Methods like MR-Egger regression and the weighted median estimator provide robustness checks.

The HDL cholesterol story is the lecture's most dramatic example. Decades of observational evidence said high HDL protects against heart attack. MR said it doesn't. Clinical trials with HDL-raising drugs subsequently failed — vindicating MR's causal inference over observational correlation.

---

## The Through-Line

Both halves of the lecture share a common theme: **association is not causation, but genetics can help us get closer to causation** — whether by linking GWAS loci to the genes they regulate (TWAS + colocalization) or by testing whether an exposure truly drives disease (MR). Neither method is perfect; each makes assumptions that must be scrutinized. Together they form a toolkit for extracting biological meaning from GWAS results.

---

## Pedagogical Beats (for Slide Design)

| Beat | Purpose |
|------|---------|
| Non-coding variant problem | Motivates the whole lecture |
| Naive approach failure | Shows why systematic methods are needed |
| TWAS pipeline walkthrough | Core method — build step by step |
| Advantages vs. limitations contrast | Forces critical thinking |
| Colocalization concept + conservative bias | Nuance: methods can be too cautious |
| Correlation ≠ causation (section break) | Resets student attention for Part 2 |
| RCT analogy for MR | Makes abstract concept concrete |
| Three MR assumptions | Scaffold for evaluating any MR paper |
| HDL case study | Dramatic real-world validation |
| MR-Egger / multiple instruments | Robustness methods — not just one answer |
| Summary slides for both halves | Consolidation before moving on |

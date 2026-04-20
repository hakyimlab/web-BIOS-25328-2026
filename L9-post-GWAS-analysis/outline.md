Gene Level Association Tests and Mendelian Randomization
Hae Kyung Im, PhD
Learning Objectives
Statistical methods to examine biology of complex diseases from GWAS results
TWAS
Colocalization
Mendelian Randomization
Most GWAS catalog variants are non-coding
Which Gene Should We Target for Therapy?
Altered Protein Levels Influence Disease Risk
What is Splicing
Total mRNA and Splicing Affect Complex Traits
Expression Quantitative Trait Loci
Dose-response effect provide stronger evidence of causal link between gene expression traits and complex diseases
How do we find causal genes?
Naive Approach: Find the eGene of the top SNP
GTEx portal
Naive Approach can Lead to False Links
Naive Approach can Lead to False Links
Enrichment of eQTLs Among GWAS Catalog Variants
Association vs. Colocalization Methods
Association Approach
GWAS Discovers Loci but Mechanism Unclear
Could TWAS Identify Genes?
Can TWAS Identify Genes?
Use Genetic Predictors of Gene Expression
Transcriptome Prediction Model Training
Transcriptome Prediction Model Training
PrediXcan: TWAS with Genetically Predicted Expression
Examples of Well Predicted Genes
Accuracy of Prediction Depends on Heritability
Advantages of Gene Level Associations
Reduced multiple testing (from 10e6 to 10e4)
Genes functions are much better annotated
Validation in other model systems is possible
Direction of effects can inform on protective or deleterious effects of gene knock down
Prioritization of drug targets is more straightforward
Limitations of Current Association Methods
Limitations of Association Methods
Colocalization
Colocalization: Are causal variants = ?
Limitations of Colocalization
Fine-Mapping Example Can Be Sensitive To LD Reference
Height GIANT not colocalize Height UKB
Colocalization can help finding causal genes but can be too conservative
Recommendation for Post GWAS Analysis
Start with an association method to determine a list of candidate causal genes
sparse predictors of gene expression are better (elastic net better than BSLMM, fine-mapping may be even better)
Use colocalization to filter out LD contamination
Be aware that colocalization methods are very conservative and real signals may be tossed out
We need better reference LD
studies should share LD in addition to GWAS results
Summary Dissection of Mechanism of GWAS Variants
Most trait associated variants are non-coding making interpretation difficult
but they may act on phenotypes through regulation of gene expression traits
therefore, association with predicted expression traits may identify putatively causal genes
Also known as TWAS (Transcriptome-wide Association Study)
LD contamination issues can be mitigated further filtering the candidate causal genes with low probability of colocalization
Mendelian Randomization
Less Technical Description of MR
Mendelian Randomization
Statistical method to assess causal relationship between exposure and outcome

Can we determine causality with statistical methods?

MR leverages the fact that genotypes are not generally susceptible to reverse causation and confounding
Correlation is not Causation
Randomized Trial & Mendelian Randomization
Evidence For Causal Link
Mendelian Randomization Question
Why We Need Mendelian Randomization?
Mendelian Randomization Uses Instrumental Variable
Assumptions of Mendelian Randomization
Examples of MR and Assumptions
Examples: Horizontal and Vertical Pleiotropy
The "Good" Cholesterol Failed Mendelian Randomization Test
Single Instrument Exposure Effect Estimate
MR with Multiple Instruments
MR with Multiple Instruments
MR with Multiple Instruments
MR with Multiple Instruments
MR BASE Web Application
Summary of MR
Mendelian randomization provides evidence about putative causal relations between modifiable risk factors and disease, using genetic variants as natural experiments
Mendelian randomization is less likely to be affected by confounding or reverse causation than conventional observational studies
Like all analytical approaches, however, Mendelian randomization depends on assumptions, and the plausibility of these assumptions must be assessed
Moreover, the relevance of the results for clinical decisions should be interpreted in light of other sources of evidence
Sasha Gusev’s Tweetorial Summary of Complex Trait Genetics

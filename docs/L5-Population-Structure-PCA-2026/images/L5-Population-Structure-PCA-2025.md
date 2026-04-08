# Principal Component Analysis and Population Structure

Hae Kyung Im, PhD

![](_page_0_Picture_2.jpeg)

April 7, 2025

## **Genotype Matrix, a Treasure Trove**

| id  | rs1 | rs2 | rs3 | • • • | rsM |
|-----|-----|-----|-----|-------|-----|
| id1 | 0   | 2   | 1   |       | 0   |
| id2 | 1   | 2   | 2   |       | 2   |
| id3 | 2   | 1   | 1   |       | 1   |
| :   | :   | :   | :   | :     | :   |
| :   | :   | :   | :   | :     | :   |
| :   | :   | :   | :   | :     | :   |
| :   | :   | :   | :   | :     | :   |
|     |     |     |     | :     |     |
| idn | 1   | 2   | 0   |       | 2   |

**2**

We will see today that the genotype matrix harbors an amazing wealth of information that can be uncovered with various statistical techniques.

![](_page_2_Figure_0.jpeg)

This is probably one of the most referenced figures in genetic talks. The first two principal components of a matrix 1500 European individuals genotypes are shown. When each individual is colored by the color of the country of origin, the map of Europe emerges. This is a remarkable consequence of the genetic similarity tied to geographic proximity.

## Could Population Structure Bias GWAS Results?

![](_page_4_Figure_0.jpeg)

Spurious associations can result due to different composition of populations among cases and controls as shown in this example. Here, population 1 is overrepresented among cases while population 2 is overrepresented among controls. The red variant is more common in population 1 and the analysis will suggest that the red allele increases the risk of disease, even if there is no effect on the disease.

### **How to Correct for Population Structure?**

- 1. Correcting with genomic control (Devlin and Roeder 1999)
- 2. Inferring the latent sub-populations (Pritchard et al 2000) Fit association in each population separately and combine
- 3. Adjusting for principal components (Patterson 2006, Novembre 2008, Price et al 2010)
- 4. Mixed effects modeling (EMMAX, Kang et al 2010)

- 1. Genomic control method by Devlin and Roeder is a simple approach broadly used. As sample sizes increase, we will see that we need to revisit this approach.
- 2. If we know the subpopulations, we can run the GWAS within each and meta-analyze the results (more on this next lecture). Even if we don't know the subpopulations a priori, if they are distinct enough we may be able to identify them and run GWAS within each latent sub-population (principal component analysis will help for this).
- 3. The most common approach used now is using principal components are covariates.
- 4. Mixed effects modeling is another approach.

## Principal Component Analysis

![](_page_7_Figure_0.jpeg)

This representation of the SVD makes evident the application to latent factor identification and dimension reduction.

## Example Population Structure

![](_page_9_Picture_0.jpeg)

The international HapMap project recruited individuals who consented to have their genotypes publicly available with the goal of mapping haplotypes of the human genome.

![](_page_10_Figure_0.jpeg)

The HapMap project evolved into the 1000 Genomes project, which aimed to sequence 1000 individuals from around the globe including African, American (native), East Asian, European, and South Asian populations. As of 2020, these resources are still being heavily used to understand the human genetic diversity: https://twitter.com/JeffreyMKidd/status/1222532448744923136

Newly sequenced 1000 genomes to high coverage https://twitter.com/1000genomes/status/1294222026769604608

### **HapMap Phase 3 Populations**

| CHD<br>GIH<br>JPT | Chinese in Metropolitan Denver, Colorado Gujarati Indians in Houston, Texas Japanese in Tokyo Japan |
|-------------------|-----------------------------------------------------------------------------------------------------|
| JPT<br>LWK<br>MYI | Japanese in Tokyo, Japan  Luhya in Webuye, Kenya  Mayican ancestry in Los Angeles, California       |
| MXL<br>MKK        | Mexican ancestry in Los Angeles, California<br>Maasai in Kinyawa, Kenya                             |
| TSI               | Toscani in Italia                                                                                   |
| YRI               | Yoruba in Ibadan. Nigeria                                                                           |

![](_page_12_Figure_0.jpeg)

we can check the number of individuals in each of the HapMap 3 populations.

![](_page_13_Figure_0.jpeg)

You can check out the linked html where the code is shown to generate the principal components of the genotype matrix from the HapMap project. Each population is represented with different colors. PC1 separates the African populations (circle) from the European (square), Asian (triangles), Hispanic (+), and South Asians (crossed square). PC2 separates the European and Asian populations further.

![](_page_14_Figure_0.jpeg)

Here are the two principal components of the UK Biobank genotype data. Special methods had to be developed to be able to compute these principal components given the sheer size of the data with 500,000 individuals.

# GWAS in Multiancestry Samples

We will see next how population structure can inflate association statistics.

![](_page_16_Figure_0.jpeg)

Here we are showing the proliferation rate of the lymphoblastoid cell lines of HapMap individuals. Notice the difference in mean among populations. This is likely to cause spurious associations since SNPs with different allele frequencies among populations will correlate with these differences leading to false positives.

![](_page_17_Figure_0.jpeg)

Linear regression of growth phenotype on population yields significant differences in mean growth between populations. ASW is here the reference to which the other populations are being compared too. (By default in R orders factors in alphabetic order, this can be changed with relevel)

![](_page_18_Figure_0.jpeg)

Here we show the histogram of p-values of the association between growth phenotype and about 20K SNPs in chr 22. A concentration of small p-values suggests that either causal variants are associated with proliferation rate or that they are inflated by population structure.

![](_page_19_Figure_0.jpeg)

Manhattan plot shows no genome-wide significant hit but if we take into account that we have only 20,649 variants tested here so Bonferroni corrected threshold would be 10^{-5.6}

> 0.05/20649 [1] 2.421425e-06 > -log10(0.05/20649)

[1] 5.615929

--

--

![](_page_20_Figure_0.jpeg)

In general (exceptions to be discussed later), well behaved qq-plots follow the identity line (representing the variants that are true nulls, no relationship between the variant and the phenotype) and tend to depart significantly from the identity line for a smaller set of variants to the top right of the figure. In this qq plot, the variants depart from the identity line from the very beginning, indicating some level of associations for most variants. This is not impossible (highly polygenic traits where all are causal) but more likely to indicate inflation of the qq-plot due to population structure. Most variants have differences between populations, and that difference is being used to "explain" the mean differences in proliferation rate.

what happens if we add principal components as covariates in the regression?

![](_page_22_Figure_0.jpeg)

Here we adjust the regression adding the first 4 principal components as covariates. How many to use depends on the application, sample size, etc. In UK Biobank some people recommend using 14 but there is no consensus. It's always recommended to use sensitivity analysis. Try different numbers of PC's. Don't do p-hacking, that is do not choose the number of PC's that give you significant association for a cherry picked variant.

## Review Matrix Algebra

### **Matrix Algebra**

Addition

Scalar Multiplication

$$2 \cdot \begin{bmatrix} 1 & 8 & -3 \\ 4 & -2 & 5 \end{bmatrix} = \begin{bmatrix} 2 \cdot 1 & 2 \cdot 8 & 2 \cdot -3 \\ 2 \cdot 4 & 2 \cdot -2 & 2 \cdot 5 \end{bmatrix} = \begin{bmatrix} 2 & 16 & -6 \\ 8 & -4 & 10 \end{bmatrix}$$

Transposition

$$\begin{bmatrix} 1 & 2 & 3 \\ 0 & -6 & 7 \end{bmatrix}^{\mathrm{T}} = \begin{bmatrix} 1 & 0 \\ 2 & -6 \\ 3 & 7 \end{bmatrix}$$

![](_page_25_Figure_0.jpeg)

### **Matrix Multiplication**

$$(A * B)_{i,j} = \sum_{k} A_{i,k} B_{k,j}$$

order of matrices matters

$$(A * B)_{i,j} \neq (B * A)_{i,j}$$

Einstein notation: repeated index gets summed over

$$A_{i,k}B_{k,j} \to \sum_{k} A_{i,k}B_{k,j}$$

### **Matrix Form of System of Linear Equations**

$$\begin{aligned} a_{1,1}x_1 + a_{1,2}x_2 + \cdots + a_{1,n}x_n &= b_1 \ &\vdots \ a_{m,1}x_1 + a_{m,2}x_2 + \cdots + a_{m,n}x_n &= b_n \end{aligned}$$

https://en.wikipedia.org/wiki/Matrix\_(mathematics)

### **Derive Linear Regression Solution with Matrix Notation**

**29**

Let's assume we have demeaned and divided by sd Y's and X's

Write 
$$Y = X \beta + \varepsilon$$

Check dimensions

$$X'Y = X'X \beta + X' \epsilon$$

### **Daniella Witten's SVD Tweetorial**

Check out this masterful explanation of SVD in 24 tweets by Daniella Witten

https://twitter.com/WomenInStat/status/1285611207530098688

### **PC Plot of Vanderbilt's Patients Across Decades**

Watch this excerpt from the 2017 American Society of Human Genetics Presidential Address by Nancy Cox

<https://uchicago.box.com/s/yhgel87wyi5tqkr9f2fagufagnh5czvj>

Excerpt from 20:04 to 24:12 https://www.youtube.com/watch?v=TzZzz7SBZrw

## Hardy Weinberg Equilibrium

### **Hardy Weinberg Equilibrium**

- Random mating
- Genes inherited from the father is independent of the ones inherited from the mother
- If p = minor allele frequency of a biallelic SNP
- Suppose the variants seen in the population are A and C
- Allele frequency of A is 20% and C is 80%
- Minor allele frequency p = ?
- $P(AA) = p^2$
- P(AC or CA) = 2\*p\*(1-p)
- $P(CC) = (1-p)^2$
- \_ Tested using a chi2 test  $\sum \frac{(O-E)^2}{E} \sim \chi^2_{\rm df=(r-1)^*(c-1)}$

![](_page_33_Picture_0.jpeg)

### **Types of Heritability**

$$Y = G + E$$

$$Y = A_G + NA_G + E$$

- Broad sense heritability: var( )/var( ) *G Y*
- Narrow sense heritability: var( )/var( ) *AG Y*
- Chip heritability: additive component captured by the chip/ imputation

Additive Model: 
$$Y = \sum_{k}^{M} X_k \cdot \beta_k + E$$
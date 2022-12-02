class11
================
Kalle Liimatta A59002114

- <a href="#section-4-population-scale-analysis-homework"
  id="toc-section-4-population-scale-analysis-homework">Section 4 :
  Population Scale Analysis HOMEWORK</a>
  - <a
    href="#q1-3-read-this-file-into-r-and-determine-the-sample-size-for-each-genotype-and-their-corresponding-median-expression-levels-for-each-of-these-genotypes."
    id="toc-q1-3-read-this-file-into-r-and-determine-the-sample-size-for-each-genotype-and-their-corresponding-median-expression-levels-for-each-of-these-genotypes.">Q1
    3 : Read this file into R and determine the sample size for each
    genotype and their corresponding median expression levels for each of
    these genotypes.</a>
    - <a
      href="#the-sample-size-for-genotype-aa-ag-and-gg-are-108-233-and-121-respectively."
      id="toc-the-sample-size-for-genotype-aa-ag-and-gg-are-108-233-and-121-respectively.">The
      sample size for genotype A/A, A/G, and G/G are 108, 233, and 121,
      respectively.</a>
    - <a
      href="#the-median-expression-levels-for-aa-ag-and-gg-are-31.2-25.1-and-20.1-respectively."
      id="toc-the-median-expression-levels-for-aa-ag-and-gg-are-31.2-25.1-and-20.1-respectively.">The
      median expression levels for A/A, A/G, and G/G are 31.2, 25.1, and 20.1,
      respectively.</a>
  - <a
    href="#q1-4-generate-a-boxplot-with-a-box-per-genotype-what-could-you-infer-from-the-relative-expression-value-between-aa-and-gg-displayed-in-this-plot-does-the-snp-effect-the-expression-of-ormdl3"
    id="toc-q1-4-generate-a-boxplot-with-a-box-per-genotype-what-could-you-infer-from-the-relative-expression-value-between-aa-and-gg-displayed-in-this-plot-does-the-snp-effect-the-expression-of-ormdl3">Q1
    4 : Generate a boxplot with a box per genotype, what could you infer
    from the relative expression value between A/A and G/G displayed in this
    plot? Does the SNP effect the expression of ORMDL3?</a>
    - <a href="#boxplot" id="toc-boxplot">Boxplot:</a>
    - <a
      href="#aa-is-associated-with-significantly-higher-expression-of-ormdl3.-the-snp-does-affect-the-expression-of-ormdl3."
      id="toc-aa-is-associated-with-significantly-higher-expression-of-ormdl3.-the-snp-does-affect-the-expression-of-ormdl3.">A/A
      is associated with significantly higher expression of ORMDL3. The SNP
      does affect the expression of ORMDL3.</a>

# Section 4 : Population Scale Analysis HOMEWORK

## Q1 3 : Read this file into R and determine the sample size for each genotype and their corresponding median expression levels for each of these genotypes.

How many samples do we have?

``` r
expr <- read.table("rs8067378_ENSG00000172057.6.txt")
head(expr)
```

       sample geno      exp
    1 HG00367  A/G 28.96038
    2 NA20768  A/G 20.24449
    3 HG00361  A/A 31.32628
    4 HG00135  A/A 34.11169
    5 NA18870  G/G 18.25141
    6 NA11993  A/A 32.89721

``` r
nrow(expr)
```

    [1] 462

``` r
table(expr$geno)
```


    A/A A/G G/G 
    108 233 121 

### The sample size for genotype A/A, A/G, and G/G are 108, 233, and 121, respectively.

``` r
library(ggplot2)
```

let’s make a boxplot

``` r
box <- ggplot(expr) + aes(x=geno, y=exp, fill=geno) +
  geom_boxplot(notch=TRUE) 
box
```

![](class11_files/figure-commonmark/unnamed-chunk-5-1.png)

``` r
AA <- subset(expr, geno=="A/A")
median(AA$exp)
```

    [1] 31.24847

``` r
AG <- subset(expr, geno=="A/G")
median(AG$exp)
```

    [1] 25.06486

``` r
GG <- subset(expr, geno=="G/G")
median(GG$exp)
```

    [1] 20.07363

### The median expression levels for A/A, A/G, and G/G are 31.2, 25.1, and 20.1, respectively.

## Q1 4 : Generate a boxplot with a box per genotype, what could you infer from the relative expression value between A/A and G/G displayed in this plot? Does the SNP effect the expression of ORMDL3?

### Boxplot:

``` r
box
```

![](class11_files/figure-commonmark/unnamed-chunk-9-1.png)

### A/A is associated with significantly higher expression of ORMDL3. The SNP does affect the expression of ORMDL3.

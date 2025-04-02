# Graded Projects

### Recommended (Prio 1)

| Project Name                      | R pkg       | CRAN                                           | RDep | Last Up | JSS-DOI               | Note             | By |
|-----------------------------------|-------------|------------------------------------------------|-----:|---------|-----------------------|------------------|----|
| Mult.Emp.Likelihood Tests         | melt        | https://cran.r-project.org/package=melt        |  (2) | 2024-05 | 10.18637/jss.v108.i05 |                  |    |
| Power,Effect...Multilevel         | PUMP        | https://cran.r-project.org/package=PUMP        |    - | 2025-03 | 10.18637/jss.v108.i06 |                  |    |
| Holistic GLMs                     | holiglm     | https://cran.r-project.org/package=holiglm     |    - | 2024-12 | 10.18637/jss.v108.i07 |                  |    |
| Nonstation.Fin.Volatility         | tvgarch     | https://cran.r-project.org/package=tvgarch     |  (1) | 2024-04 | 10.18637/jss.v108.i09 |                  |    |
| Elastic Net -- All GLM            | glmnet      | https://cran.r-project.org/package=glmnet      | ~100 | 2023-08 | 10.18637/jss.v106.i01 | Hastie           |    |
| Corr.Var. Selection..grpLasso     | MLGL        | https://cran.r-project.org/package=MLGL        |    - | 2023-03 | 10.18637/jss.v106.i03 |                  |    |
| Broken Stick - Irreg. Longitud.   | brokenstick | https://cran.r-project.org/package=brokenstick |    - | 2025-03 | 10.18637/jss.v106.i07 | van Buuren;tidy* |    |
| Cond.Graph.Lasso + Cens + Missing | cglasso     | https://cran.r-project.org/package=cglasso     |  (1) | 2024-02 | 10.18637/jss.v106.i07 |                  |    |

### With __less__ Priority

| Proj.Name                     | R pkg     | CRAN                                         | RDep | Last Up | JSS-DOI               | Note           | By |
|-------------------------------|-----------|----------------------------------------------|-----:|---------|-----------------------|----------------|----|
| Big Non-Gauss Spatio-Temporal | FRK       | https://cran.r-project.org/package=FRK       |    1 | 2024-04 | 10.18637/jss.v108.i10 | Cressie        |    |
<!-- | Modeling Population Growth    | biogrowth | https://cran.r-project.org/package=biogrowth |    - | 2024-04 | 10.18637/jss.v107.i01 | tidy*; 11 vign | SGA | -->


The JSS-DOI can be appended to  https://doi.org/  to get a link to an
electronic publication in JSS = Journal of Statistical Software (https://www.jstatsoft.org/)
where you can also find the article, and more,
e.g. Volume 107, issue 10  is  v107i10 -->  
https://www.jstatsoft.org/article/view/v107i10

## Instructions

1. Choose one (and tell me *which*; each student a _different_ one)  
  ==> you get _one_ R CRAN package assigned.

  Each of these (list below) has a corresponding JSS publication, a good
  "promise" / "indication" for a well written, somewhat "serious" R package.
  
2. Install the CRAN package  *BUT* also
3. Download and *unpack* the "tar-ball" on your own computer,
  i.e. on the package CRAN web page, under `Download:`,  the first entry,
  `Package Source:`, file name  `<blabla>.tar.gz` i.e. ending in `.tar.gz`

5. Look at important functions; maybe from browsing the JSS publication
  ("paper", always a PDF).  Start writing a *.Rmd (R markdown file) with
  __reproducible__ R code, i.e., often with  `library("<your_package>")`
  very early.   End the *.Rmd  with a call to `sessionInfo()`

6. Comment about that function / functions; does it also work, or give good
   error message when you use only 1 observation (or even 0)?
   How does it work, when you replace an observation / number by `NA`?
   How when you use `+Inf`?
   
   Comment and possibly propose fixes (to the source code, possibly)
   where appropriate and possible.
  
6. I want you to use CRAN package `microbenchmark` (as in the lecture), or
   an alternative one, if you prefer.  I do want to see at least one "speed
   analysis", where you change the number of observations of an example,
   using e.g.,  n=10, 20, 50, 100, 200, 500, 1000 
   or varying another "dimension" parameter of your data example, and
   visualize via a boxplot e.g., as in the lecture's `matrix_df_timing.Rmd`
   script.
   


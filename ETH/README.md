# Programming with *R* for *R*eproducible *R*esearch

## Table of Contents

### Week 1 -- Introduction
 - Reproducible Reseach -->  Rmarkdown, Sweave, Knitr, all based on Donald
   Knuth's "noweb".
   What happens in R Studio when klicking "Knit": Knitr (/ Sweave) and
   Pandoc; Graphically, Kieran
   Healy (see (https://kieranhealy.org/resources/))'s visualization:
   [Rmarkdown Diagram](https://polybox.ethz.ch/index.php/s/7vlx3zTAAqkoGyX).

 - R/packages-search(https://cran.r-project.org/doc/FAQ/R-FAQ.html]) Question 7.31;
 	[R/10x0.1-num.Rmd](R/10x0.1-num.Rmd)


   In R,
   everything that **exists** is an object;
   everything that **happens** is a function call

 - Is that true?  Which function is called in `x <- 3` ? (functions-1.R)[R/functions-1.R]

### Week 2 --
 - Hadley Wickham's  Advanced R: [https://adv-r.had.co.nz]
 - "Quiz" of Chapter 1 "Data Structures" --> `attributes`, atomic vectors,
   general vectors -- including `list()`s
 - Everything .. a function call, more:	(R/functions-1.R)[R/functions-1.R],
   notably help pages  `?c` (Details: output type via "hierarchy"), and `?[`
 - Generic functions `c()`, `[`, ...  `methods(<fun>)` to see them all.
 - Everything .. an object, more: (R/type-mode-class.Rmd)[R/type-mode-class.Rmd],
   shows `typeof()`, `class()`, `mode()` of atomic and more, including
   "language objects"


### Week 3

 - Recapitulate:  [R/functions-2.Rmd](R/functions-2.Rmd)
 - Functions in packages in R: (R/packages-search.Rmd)
 - The three parts of every (non-`.Primitive`) function: ....
 - Lexical Scoping - `environment` [R/envexample1.R](R/envexample1.R)
 - `environment`s : Look at Wickham's chapter [8. Environments](https://adv-r.had.co.nz/Environments.html)

---
[Martin Maechler](https://stat.ethz.ch/~maechler), [ETH Zurich](https://www.ethz.ch.)





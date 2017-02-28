## class : c("glm", "lm")

(ml <- methods(class = "lm"))
(mg <- methods(class = "glm"))
str(ml)

(ig <- attr(mg,"info"))
(il <- attr(ml,"info"))

str(n.l <- il[,"generic"])
str(n.g <- ig[,"generic"])

setdiff(n.l, n.g)
##  [1] "alias"          "attrassign"     "case.names"     "dfbeta"
##  [5] "dfbetas"        "dummy.coef"     "fortify"        "hatvalues"
##  [9] "kappa"          "labels"         "model.matrix"   "plot"
## [13] "proj"           "qr"             "simulate"       "variable.names"

### These functions have "lm" methods, but no "glm" ones ...
### so  <func>.lm() is called when you use   <func>( <glm )

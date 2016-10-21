# How can we do this better (faster)?
# Consider the following bogus minimal example:
# - rectangular data structure,i.e.,
# matrix or data.frame, one-row-one-observation format
# - row wise transformation needs to be done, but given some condition:
# e.g.:  The price of the flower depends on 
# its total blossom size sepal Petal length, if # 
# it's a setosa, otherwise it depends on the area

# now it's quite tempting to aim a apply solution
# which is intuitive but slow.
data(iris)
computePrice <- function(a,b,
                         spec,
                         VAT = .08){
  if(spec == "setosa"){
    tot <- (a+b)*1.10
  } else{
    tot <- (a*b)/2
  }
  tot*(1+VAT)
}

# 
iris$Price <- apply(iris,1,function(x){
  computePrice(as.numeric(x["Sepal.Length"]),
               as.numeric(x["Petal.Length"]),
               x["Species"]) 
})

# At 3 million records, this takes a long time in R, while SQL does it within a few seconds. 
# data.table / dplyr is an option, but how can 
# we speed up exercises like this using the tricks of linear algebra / R vectorization ?
# This problem is easy, but how to approach problems in general using indexing, vectors and matrices? 
# How to write functions that are vectorized and can be applied on data.frame without loops/apply?
# How use kronecker products etc. efficiently?

# So what to do ? here's a (way faster) suggestion from @fabiangehring - THX!
# Don't use a pattern like example 1. Use vectorization!
# Both, example 2 and 3 will be way! faster than the initial questions. 

# Ex2
VAT <- 0.08
setosa <- iris$Species == "setosa"
iris$Price2[setosa] <- 1.1 * (1 + VAT) * (iris[, "Sepal.Length"][setosa] + iris[, "Petal.Length"][setosa])
iris$Price2[!setosa] <- (1 + VAT) * (iris[, "Sepal.Length"][!setosa] * iris[, "Petal.Length"][!setosa])/2
iris$Price2 





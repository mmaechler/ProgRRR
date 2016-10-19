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




## From: Rene Locher .... @ ZHAW.ch
## To: Martin Maechler <maechler@stat.math.ethz.ch>
## Subject: Programming with R: Difference between quote() and expression()
## Date: Tue, 22 Mar 2016 20:37:39 +0100

## Dear Martin

## Could you tell me the difference between quote() and expression()? The
## only thing I have find out is, that expression() accepts a "list" of R
## expressions while quote() accepts only one.

ex1 <- expression(1 + 0:9)
ex1
str(ex1)
eval(ex1) # 1:10

qu1 <- quote(1 + 0:9)
qu1
str(qu1)
eval(qu1)

## Kind regards
## René


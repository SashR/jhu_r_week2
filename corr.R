corr <- function(directory, threshold = 0){
  z <- complete(directory)
  zSliced <- z[z$nobs > threshold,]
  
  
}

cr <- corr("specdata", 950)
cr
head(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313


cr <- corr("specdata", 400)
head(cr)

## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

summary(cr)

##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313



cr <- corr("specdata", 5000)
summary(cr)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 

length(cr)

## [1] 0

cr <- corr("specdata")
summary(cr)

##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000

length(cr)

## [1] 323


cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)


RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
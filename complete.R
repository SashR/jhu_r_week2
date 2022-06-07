complete <- function(directory, id = 1:332){
  # function to generate fileName
  fileName <- function(val){
    y <- if(val < 10)  "00"
    else if (val < 100)  "0"
    else  "0"
    paste("./",directory,"/",y,val,".csv", sep = "")
  }
  # function to find nobs from id
  nobsFind <- function(val){
    file <- read.csv(fileName(val), header = TRUE) 
    nrow(file[!is.na(file$sulfate) & !is.na(file$nitrate),])
  }
  
  nobs <- c()
  
  # read all data from files of id inside directory
  for(i in id){
    nobs <- c(nobs, nobsFind(i))
  }
  
  data.frame(id = id, nobs = nobs)
}

complete("specdata", 1)
##   id nobs
## 1  1  117


complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

complete("specdata", 3)
##   id nobs
## 1  3  243



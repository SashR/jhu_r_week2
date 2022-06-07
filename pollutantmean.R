pollutantmean <- function(directory, pollutant, id=1:332){
  # function to generate fileName
  fileName <- function(val){
    y <- if(val < 10)  "00"
    else if (val < 100)  "0"
    else  "0"
    paste("./",directory,"/",y,val,".csv", sep = "")
  }
  # read first data frame
  files <- read.csv(fileName(id[1]), header = TRUE)
  # read all data from files of id inside directory
  if(length(id) > 1){
    for(i in id[2]:id[length(id)]){
      newFile <- read.csv(fileName(i), header = TRUE)  
      files <- rbind(files, newFile)
    }
  }
  # remove na's and return mean
  mean(files[[pollutant]][!is.na(files[[pollutant]])])
  
}


pollutantmean("specdata", "sulfate", 1:10) # [1] 4.064128

pollutantmean("specdata", "nitrate", 70:72) # [1] 1.706047


pollutantmean("specdata", "nitrate", 23)  # [1] 1.280833
pollutantmean("specdata", "nitrate", c(21,25))  # [1] 1.280833



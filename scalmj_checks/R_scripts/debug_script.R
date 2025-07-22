#debug script
library(jmvcore)


my_files <- list.files("../R", full.names = TRUE)
source("../R/adjusting.b.R")
source("../R/adjusting.f.R")
lapply(my_files, source)


dat = read.csv("Original_Data/GEMS_Dataset.csv")
head(dat)
summary(dat)
str(dat)

adjusting(data=dat, dep="Score", factors="Sex", covs=c("Age", "Education"))

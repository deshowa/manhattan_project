# Author: Benjamin Reddy
# Taken from pages 49-50 of O'Neil and Schutt

## You need a perl interpreter to do this on Windows.

## It's automatic in Mac


##bk <- read.xls("rollingsales_brooklyn.xls",pattern="BOROUGH")



# So, save the file as a csv and use read.csv instead


#bk <- read.csv("rollingsales_manhattan.csv",skip=4,header=TRUE)

readURL <- "analysis/data/rollingsales_manhattan.csv"

bk <- read.csv(readURL,skip=4,header=TRUE)

str(bk)
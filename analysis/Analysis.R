# Author: Benjamin Reddy
# Taken from pages 49-50 of O'Neil and Schutt

require(gdata)
require(plyr) 
#Added by Monnie McGee




## You need a perl interpreter to do this on Windows.

## It's automatic in Mac


##bk <- read.xls("rollingsales_brooklyn.xls",pattern="BOROUGH")



# So, save the file as a csv and use read.csv instead


#bk <- read.csv("rollingsales_manhattan.csv",skip=4,header=TRUE)

readURL<-"https://raw.githubusercontent.com/deshowa/manhattan_project/master/analysis/data/rollingsales_manhattan.csv"

bk <- read.csv(readURL,skip=4,header=TRUE)




## Check the data



head(bk)

summary(bk)

str(bk) 


# Very handy function!



## clean/format the data with regular expressions

## More on these later. For now, know that the

## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.

# We create a new variable that is a "clean' version of sale.price.

# And sale.price.n is numeric, not a factor.


bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))

count(is.na(bk$SALE.PRICE.N))


names(bk) <- tolower(names(bk)) 

# make all variable names lower case

## Get rid of leading digits


bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))



## Change sale.date to Date forat in  R
## had to change this line to use a specific format of m-d-y

bk$sale.date <- as.Date(bk$sale.date, "%m/%d/%Y")

#Manhattan data read in year.built as int, so this line doesn't look needed
bk$year.built <- as.numeric((bk$year.built))




## do a bit of exploration to make sure there's not anything

## weird going on with sale prices



attach(bk)

hist(sale.price.n) 

# Something weird here

hist(sale.price.n)

hist(sale.price.n[sale.price.n>0])

#That didn't do it.  If we check summary we can see a huge range
summary(sale.price.n)

#Max is 4.1 x 10^9....yes that's billions.  So maybe the log histogram will be more informative

hist(log(bk$sale.price.n, base = 10))

#or we can limit the histogram to a lesser value, since quartile 3 is $2MM
hist(sale.price.n[sale.price.n<100e6])

#but that still shows one big cluster

#there's no zero's in our set

hist(gross.sqft[sale.price.n==0])

detach(bk)



## keep only the actual sales


bk.sale <- bk[bk$sale.price.n!=0,]

plot(bk.sale$gross.sqft,bk.sale$sale.price.n)

plot(log(bk.sale$gross.sqft, base = 10),log(bk.sale$sale.price.n, base = 10))





## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]

dim(bk.homes)

plot(log(bk.homes$gross.sqft, base = 10),log(bk.homes$sale.price.n, base =10))

summary(bk.homes[which(bk.homes$sale.price.n<100000),])






## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log(bk.homes$sale.price.n) <=5) + 0

bk.homes <- bk.homes[which(bk.homes$outliers==0),]

plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))


## Check the data


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
str(bk)

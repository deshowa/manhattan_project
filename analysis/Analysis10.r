## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]

dim(bk.homes)

plot(log(bk.homes$gross.sqft, base = 10),log(bk.homes$sale.price.n, base =10))

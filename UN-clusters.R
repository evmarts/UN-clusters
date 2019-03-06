library(rworldmap)
library(countrycode)

X <- read.table(file='unvotes.csv', sep=',', row.names=1, header=TRUE)
X2 <- X[complete.cases(X),]

set.seed(123)
b <- kmeans(t(X2), centers=5, iter.max=20, nstart=1)
table(b$cluster)

b <- kmeans(t(X2), centers=5, iter.max=20, nstart=1)
table(b$cluster)

# Take the best solution out of 1000 random starts
b <- kmeans(t(X2), centers=5, iter.max=20, nstart=1000)
split(colnames(X2), b$cluster)

these <- countrycode(colnames(X2), 'country.name', 'iso3c')
malDF <- data.frame(country = these, cluster = b$cluster)
malMap <- joinCountryData2Map(malDF, joinCode = "ISO3",
                              nameJoinColumn = "country")
par(mai=c(0,0,0,0),xaxs="i",yaxs="i")
mapCountryData(malMap, nameColumnToPlot="cluster", catMethod = "categorical",
               missingCountryCol = 'white', addLegend=FALSE, mapTitle="",
               colourPalette=c('darkgreen', 'hotpink', 'tomato', 'blueviolet', 'yellow'),
               oceanCol='dodgerblue')

library(cluster)
these <- countrycode(colnames(X2), 'country.name', 'iso3c')
malDF <- data.frame(country = these, cluster = b$cluster)
malMap <- joinCountryData2Map(malDF, joinCode = "ISO3", nameJoinColumn = "country")
par(mai=c(0,0,0,0),xaxs="i",yaxs="i")
mapCountryData(malMap, nameColumnToPlot="cluster", catMethod = "categorical",
               missingCountryCol = 'white', addLegend=FALSE, mapTitle="",
               colourPalette=c('yellow', 'tomato', 'blueviolet'),
               oceanCol='dodgerblue')
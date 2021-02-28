#dataLoader.r

#download boundaries
#download.file("https://www.dropbox.com/s/gd9njarelxfxfmz/LondonWards.zip?dl=0", "LondonWards1.zip")
#unzip contents to new data directory - you will have to do this manually
#as I've been having a nightmare with the unzip function in R...
wd <- getwd()

#now read the boundaries in...
  wardBoundaries <- readOGR(paste(wd,"/data", sep = ""), "capatotal")
#transform into wgs84
# wardBoundaries <- spTransform(wardBoundaries, "+init=epsg:4326")
  wardBoundaries <- spTransform(wardBoundaries, "+init=epsg:23030")
  
#now read in some data...
# wardData <- read.csv(paste(wd,"/data/LondonData.csv", sep = ""))
 # wardData <- wardBoundaries@data
#replace nas with 0
# wardData[is.na(wardData)] <- 0

#drop city of London
# wardData1 <- wardData[!is.na(wardData$Pop2015),]

#join data to boundaries
# wardBoundaries@data <- data.frame(wardBoundaries@data, wardData1[match(wardBoundaries@data[,"WD11CD"], wardData[,"Wardcode"]),])

#drop city of London using the empty data in the pop2015 column
# wardBoundaries@data <- wardBoundaries@data[!is.na(wardBoundaries@data$Pop2015),]

#now lop out some un-needed columns and set data to interger data to numeric
####
# wardBoundaries@data[11:79] <- lapply(wardBoundaries@data[11:79], as.numeric)
 # wardBoundaries@data[] <- NULL
#writePolyShape(wardBoundaries, "wardBoundaries.shp")

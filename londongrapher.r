#londongrapher.r

#classIntStyle <- "equal"

londongrapher <- function(variable, colourbrewerpalette, classIntStyle){
  breaks<-classIntervals(wardBoundaries@data[[variable]], n=6, style=classIntStyle)
  breaks <- breaks$brks
  
  pal <- colorBin(palette = colourbrewerpalette, 
                  domain = wardBoundaries@data[[variable]],
                  #create bins using the breaks object from earlier
                  bins = breaks
  )
  
  #plot_ly(wardBoundaries@data, x=wardBoundaries@data[[variable]])
  ggplot(wardBoundaries@data, aes_string(x = variable)) +
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] < breaks[1]), fill=pal(breaks[1]), bins = 100)+
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] >= breaks[1] & wardBoundaries@data[[variable]] < breaks[2]), fill=pal(breaks[2]), bins = 100)+
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] >= breaks[2] & wardBoundaries@data[[variable]] < breaks[3]), fill=pal(breaks[3]), bins = 100)+
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] >= breaks[3] & wardBoundaries@data[[variable]] < breaks[4]), fill=pal(breaks[4]), bins = 100)+
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] >= breaks[4] & wardBoundaries@data[[variable]] < breaks[5]), fill=pal(breaks[5]), bins = 100)+
    geom_histogram(data = subset(wardBoundaries@data, wardBoundaries@data[[variable]] >= breaks[5] & wardBoundaries@data[[variable]] < breaks[6]), fill=pal(breaks[6]), bins = 100)+
    theme_dark()
}


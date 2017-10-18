install.packages(c("maps", "maptools", "rgdal"), dependencies=TRUE)
library(maps)
library(maptools)
library(rgdal)

# Conterminous United States
map("state")
map("state", regions = "california")
map("state", regions = "washington")
map("state", regions = "florida")
# States together
map("state", regions = c("california", "washington", "florida"))
# See state region names
state.fips

#Working with Shapefiles

usa <- readShapePoly("data/census_bureau/cb_2013_us_state_20m/cb_2013_us_state_20m.shp")
plot(usa)
# Only conterminous United States
conterm <- usa[usa$STATEFP != "02" & usa$STATEFP != "15" & usa$STATEFP != "72",]
plot(conterm)
# World
countries <- readShapePoly("data/nautral_earth/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp")
plot(countries)
# Spain
spain <- countries[countries$name == "Spain",]
plot(spain)
# India
india <- countries[countries$name == "India",]
plot(india)
# Canada
canada <- countries[countries$name == "Canada",]
plot(canada)
# See country names
countries$name
countries@data[1:2, 1:5]
colnames(countries@data)
# Europe
india_proj4 <- "+proj=aea +lat_1=28 +lat_2=12 +lat_0=20 +lon_0=78 +x_0=2000000 +y_0=2000000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
proj4string(countries) <- CRS("+proj=longlat")
india <- countries[countries$name == "India",]
india_projected <- spTransform(india, CRS(india_proj4))
plot(india_projected, asp=1)
install.packages("nycflights13")
library(nycflights13)
ind<- readShapePoly("IND_adm/IND_adm2")
india_proj4 <- "+proj=aea +lat_1=28 +lat_2=12 +lat_0=20 +lon_0=78 +x_0=2000000 +y_0=2000000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
plot(ind)

# US Boundaries
usa <- readShapePoly("data/census_bureau/cb_2013_us_state_20m/cb_2013_us_state_20m.shp", proj4string=CRS("+proj=longlat"))
conterm <- usa[usa$STATEFP != "02" & usa$STATEFP != "15" & usa$STATEFP != "72",]
plot(conterm)

# Points on the map, non-projected
points(airports$lon, airports$lat)

# Project
conterm_proj4 <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lon_0=97.2w"
conterm_projected <- spTransform(conterm, CRS(conterm_proj4))

plot(conterm_projected)
latlon <- data.frame(airports$lon, airports$lat)
coordinates(latlon) <- c("airports.lon", "airports.lat")

proj4string(latlon) <- CRS("+proj=longlat")
latlon_projected <- spTransform(latlon, CRS(conterm_proj4))
points(latlon_projected)
plot(conterm)

symbols(airports$lon, airports$lat, circles=.008*sqrt(airports$alt), 
        add=TRUE, inches=FALSE, bg="#00000050", lwd=0.5)

plot(conterm_projected, border="#cccccc", lwd=0.5)

symbols(latlon_projected@coords, circles=800*sqrt(airports$alt), 
        add=TRUE, inches=FALSE, bg="#00000050", lwd=0.5)
crime <- read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.tsv", header=TRUE, sep="\t")

View(crime)

lax <- airports[airports$faa =="LAX",]
jfk <- airports[airports$faa =="JFK",]

plot(conterm, border="#cccccc", lwd=0.5)

points(c(lax$lon, jfk$lon), c(lax$lat, jfk$lat), col="red", lwd=2, pch=19)

states <- readShapePoly("data/census_bureau/cb_2013_us_state_20m/cb_2013_us_state_20m.shp", proj4string=CRS("+proj=longlat"))

plot(ind)
data <- read.csv("nfhs4-district-level.csv")

data <-read.csv("data.csv")
data_women <- aggregate(Women~State.1, data=data, FUN=sum)
data_men <- aggregate(Men~State.1, data=data, FUN=sum)
total <- merge(data_women,data_men,by="State.1")
total$percent_women <- total$Women/(total$Women + total$Men)
ind<- readShapePoly("IND_adm/IND_adm1", 
                    proj4string =CRS("+proj=aea +lat_1=28 +lat_2=12 +lat_0=20 +lon_0=78 +x_0=2000000 +y_0=2000000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"))
pickColor <- function(x) {
  if (is.na(x)) {
    col <- "#ffffff"
  }
  else if (x > .1) {
    col <- "#636363"
  }
  else if (x > .05) {
    col <- "#bdbdbd"
  }
  else {
    col <- "#f0f0f0"
  }
  return(col)
}
total$col <- sapply(total$percent_women, pickColor)

plot(ind, col=total$col, border="#ffffff", lwd=0.5)

par(new=TRUE, plt=c(0.1, 0.25, .35, .5))
plot(0:1, 0:1, type="n", xlab="", ylab="", asp=1, axes=FALSE)
col <- c("#f0f0f0", "#bdbdbd", "#636363")
breaks <- c(2, 3)
rect_width <- 1 / length(col)
xleft <- 0:(length(col)-1) * rect_width
ybottom <- rep(.1, length(col))
xright <- 1:length(col) * rect_width
ytop <- rep(.2, length(col))
rect(xleft, ybottom, xright, ytop, col=col, border="#e0e0e0", lwd=.5)
text(.5, .35, "Births Per Woman\n in 2010", cex=.7)
text(1:(length(col)-1) * rect_width, .04, labels = breaks, cex=0.7)


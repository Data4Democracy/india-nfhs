install.packages(c("maps", "maptools", "rgdal"), dependencies=TRUE)
library(maps)
library(maptools)
library(rgdal)

data <-read.csv("data.csv")
data$ImprovedDrinkingWater<-data$Households.with.an.improved.drinking.water.source1
data$ImprovedDrinkingWater<-data$ImprovedDrinkingWater/100
#data_women <- aggregate(Women~State.1, data=data, FUN=sum)
#data_men <- aggregate(Men~State.1, data=data, FUN=sum)
data1 <- aggregate(ImprovedDrinkingWater~State.1, data=data, FUN=mean)

#total <- merge(data_women,data_men,by="State.1")
#total$percent_women <- total$Women/(total$Women + total$Men)
ind<- readShapePoly("IND_adm/IND_adm1", 
                    proj4string =CRS("+proj=aea +lat_1=28 +lat_2=12 +lat_0=20 +lon_0=78 +x_0=2000000 +y_0=2000000 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"))
pickColor <- function(x) {
  if (is.na(x)) {
    col <- "#ffffff"
  }
  else if (x < 0.5) {
    col <- "#f0f0f0"
  }
  else if (x < 0.6) {
    col <- "#cecece"
  }
  else if (x < 0.7) {
    col <- "#bdbdbd"
  }
  else if (x < .8) {
    col <- "#a5a5a5"
  }
  else if (x < .9) {
    col <- "#939393"
  }
  else {
    col <- "#636363"
  }
  return(col)
}

data1$col <- sapply(data1$ImprovedDrinkingWater, pickColor)

plot(ind, col=data1$col, border="#ffffff", lwd=0.5)

par(new=TRUE, plt=c(0.1, 0.25, .35, .5))
plot(0:1, 0:1, type="n", xlab="", ylab="", asp=1, axes=FALSE)
col <- c("#ffffff", "#f0f0f0", "#cecece", "#bdbdbd", "#a5a5a5","#939393", "#636363")
breaks <- c(2, 3,4,5,6,7)
rect_width <- 1 / length(col)
xleft <- 0:(length(col)-1) * rect_width
ybottom <- rep(.1, length(col))
xright <- 1:length(col) * rect_width
ytop <- rep(.2, length(col))
rect(xleft, ybottom, xright, ytop, col=col, border="#e0e0e0", lwd=.5)
text(.5, .35, "% of Households With Improved Drinking Water", cex=0.7)
text(1:(length(col)-1) * rect_width, .04, labels = breaks, cex=0.7)

#States and Districts
#Andaman and Nicobar
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_andamanandnicobar <- ind_district[ind_district$NAME_1 == "Andaman and Nicobar",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_andamanandnicobar, col=data$col, border="#ffffff", lwd=0.5, main = "Andaman and Nicobar")

#Andhra Pradesh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_andhrapradesh <- ind_district[ind_district$NAME_1 == "Andhra Pradesh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_andhrapradesh, col=data$col, border="#ffffff", lwd=0.5, main = "Andhra Pradesh")

#Arunachal Pradesh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_arunachalpradesh <- ind_district[ind_district$NAME_1 == "Arunachal Pradesh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_arunachalpradesh, col=data$col, border="#ffffff", lwd=0.5, main = "Arunachal Pradesh")

#Assam
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_assam <- ind_district[ind_district$NAME_1 == "Assam",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_assam, col=data$col, border="#ffffff", lwd=0.5, main = "Assam")

#Assam
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_bihar <- ind_district[ind_district$NAME_1 == "Bihar",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_bihar, col=data$col, border="#ffffff", lwd=0.5, main = "Bihar")

#Karnataka
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_karnataka <- ind_district[ind_district$NAME_1 == "Karnataka",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_karnataka, col=data$col, border="#ffffff", lwd=0.5, main = "Karnataka")

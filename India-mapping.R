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

#Bihar
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_bihar <- ind_district[ind_district$NAME_1 == "Bihar",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_bihar, col=data$col, border="#ffffff", lwd=0.5, main = "Bihar")

#Chandigarh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_chandigarh <- ind_district[ind_district$NAME_1 == "Chandigarh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_chandigarh, col=data$col, border="#ffffff", lwd=0.5, main = "Chandigarh")

#Chandigarh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_chhattisgarh <- ind_district[ind_district$NAME_1 == "Chhattisgarh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_chhattisgarh, col=data$col, border="#ffffff", lwd=0.5, main = "Chhanttisgarh")

#Chhattisgrah
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_dadranagar <- ind_district[ind_district$NAME_1 == "Dadra and Nagar Haveli",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_dadranagar, col=data$col, border="#ffffff", lwd=0.5, main = "Dadra and Nagar Haveli")

#Daman and Diu
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_damandiu <- ind_district[ind_district$NAME_1 == "Daman and Diu",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_damandiu, col=data$col, border="#ffffff", lwd=0.5, main = "Daman and Diu")

#Delhi
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_delhi <- ind_district[ind_district$NAME_1 == "Delhi",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_delhi, col=data$col, border="#ffffff", lwd=0.5, main = "Delhi")

#Goa
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_goa <- ind_district[ind_district$NAME_1 == "Goa",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_goa, col=data$col, border="#ffffff", lwd=0.5, main = "Goa")

#Gujarat
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_gujarat <- ind_district[ind_district$NAME_1 == "Gujarat",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_gujarat, col=data$col, border="#ffffff", lwd=0.5, main = "Gujarat")

#Haryana
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_haryana <- ind_district[ind_district$NAME_1 == "Haryana",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_haryana, col=data$col, border="#ffffff", lwd=0.5, main = "Haryana")

#Himachal Pradesh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_himachalpradesh <- ind_district[ind_district$NAME_1 == "Himachal Pradesh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_haryana, col=data$col, border="#ffffff", lwd=0.5, main = "Himachal Pradesh")

#Jammu and Kashmir
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_jammukashmir <- ind_district[ind_district$NAME_1 == "Jammu and Kashmir",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_jammukashmir, col=data$col, border="#ffffff", lwd=0.5, main = "Jammu and Kashmir")

#Jharkhand
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_jharkhand <- ind_district[ind_district$NAME_1 == "Jharkhand",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_jharkhand, col=data$col, border="#ffffff", lwd=0.5, main = "Jharkhand")

#Karnataka
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_karnataka <- ind_district[ind_district$NAME_1 == "Karnataka",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_karnataka, col=data$col, border="#ffffff", lwd=0.5, main = "Karnataka")

#Kerala
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_kerala <- ind_district[ind_district$NAME_1 == "Kerala",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_kerala, col=data$col, border="#ffffff", lwd=0.5, main = "Kerala")

#Madhya Pradesh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_madhyapradesh <- ind_district[ind_district$NAME_1 == "Madhya Pradesh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_madhyapradesh, col=data$col, border="#ffffff", lwd=0.5, main = "Madhya Pradesh")

#Maharashtra
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_maharashtra <- ind_district[ind_district$NAME_1 == "Maharashtra",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_maharashtra, col=data$col, border="#ffffff", lwd=0.5, main = "Maharashtra")

#Manipur
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_manipur <- ind_district[ind_district$NAME_1 == "Manipur",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_manipur, col=data$col, border="#ffffff", lwd=0.5, main = "Manipur")

#Meghalaya
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_meghalaya <- ind_district[ind_district$NAME_1 == "Meghalaya",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_meghalaya, col=data$col, border="#ffffff", lwd=0.5, main = "Meghalaya")

#Mizoram
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_mizoram <- ind_district[ind_district$NAME_1 == "Mizoram",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_mizoram, col=data$col, border="#ffffff", lwd=0.5, main = "Mizoram")

#Nagaland
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_nagaland <- ind_district[ind_district$NAME_1 == "Nagaland",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_nagaland, col=data$col, border="#ffffff", lwd=0.5, main = "Nagaland")

#Orissa
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_orissa <- ind_district[ind_district$NAME_1 == "Orissa",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_orissa, col=data$col, border="#ffffff", lwd=0.5, main = "Orissa")

#Puducherry
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_puducherry <- ind_district[ind_district$NAME_1 == "Puducherry",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_puducherry, col=data$col, border="#ffffff", lwd=0.5, main = "Puducherry")

#Punjab
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_punjab <- ind_district[ind_district$NAME_1 == "Punjab",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_punjab, col=data$col, border="#ffffff", lwd=0.5, main = "Punjab")

#Rajasthan
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_rajasthan <- ind_district[ind_district$NAME_1 == "Rajasthan",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_rajasthan, col=data$col, border="#ffffff", lwd=0.5, main = "Rajasthan")

#Sikkim
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_sikkim <- ind_district[ind_district$NAME_1 == "Sikkim",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_sikkim, col=data$col, border="#ffffff", lwd=0.5, main = "Sikkim")

#Tamil Nadu
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_tamilnadu <- ind_district[ind_district$NAME_1 == "Tamil Nadu",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_tamilnadu, col=data$col, border="#ffffff", lwd=0.5, main = "Tamil Nadu")

#Telangana
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_telangana <- ind_district[ind_district$NAME_1 == "Telangana",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_telangana, col=data$col, border="#ffffff", lwd=0.5, main = "Telangana")

#Tripura
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_tripura <- ind_district[ind_district$NAME_1 == "Tripura",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_tripura, col=data$col, border="#ffffff", lwd=0.5, main = "Tripura")

#Uttar Pradesh
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_uttarpradesh <- ind_district[ind_district$NAME_1 == "Uttar Pradesh",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_uttarpradesh, col=data$col, border="#ffffff", lwd=0.5, main = "Uttar Pradesh")

#Uttaranchal
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_uttaranchal <- ind_district[ind_district$NAME_1 == "Uttaranchal",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_uttaranchal, col=data$col, border="#ffffff", lwd=0.5, main = "Uttaranchal")

#West Bengal
ind_district<- readShapePoly("IND_adm/IND_adm2")
ind_westbengal <- ind_district[ind_district$NAME_1 == "West Bengal",]
data$col <- sapply(data$ImprovedDrinkingWater, pickColor)
plot(ind_westbengal, col=data$col, border="#ffffff", lwd=0.5, main = "West Bengal")















household <- read.csv('household_truncated.csv')

#First lets looks the the 4 variables that capture geographic locations.

summary(household$HV025)
#Rural Urban 
#58805 50236 

summary(household$HV026)
#Capital, large city     Countryside      Small city     Town 
#23847                   58805            7761           18628

summary(household$SHCITY)
#Chennai   Delhi City   Hyderabad   Indore    Kolkata     Meerut      Mumbai 
#2037      3110         2741        1877      2291        2127        2187 
#Nagpur     NA's 
#2205       90466 

summary(household$SH025)
#Large city   Large town  Mega city   Rural   Small city  Small town 
#16173        4116        7674        58805   7761        14512 

##From the above 4 summaries, we can infer that 'Rural' in household$SH025,
##'Countryside' in #household$HV026 and 'Rural' in household$HV025 are the same.
 
##'Town' of HV026 is further divided into 'Large town' and 'Small town' in SH025.
##'Capital, large city' of HV026 is further divided into
##'Large city' & 'Mega city'in SH025.
##'Capital, large cty' + 'Small City' + 'Town' is 'Urban'


##### Now we create a subset for each of these geographical pointers #####

#Rural household subset
RuralH <- subset(household, HV025 == 'Rural')

#Urban household subset
UrbanH <- subset(household, HV025 == 'Urban')

#Capital, large city household subset
CLCityH <- subset(household, HV026 == 'Capital, large city')

#Small city household subet
SCityH <- subset(household, HV026 == 'Small city') 

#Town household subset
TownH <- subset(household, HV026 == 'Town')

#Large city household sebset
LCityH <- subset(household, SH025 == 'Large city')

#Large town household subset
LTownH <- subset(household, SH025 == 'Large town')

#Mega city household subset
MCityH <- subset(household, SH025 == 'Mega city')

#Small town household subset
STownH <- subset(household, SH025 == 'Small town')


#Now we will analyse the drinking water(HV201) souce by geographic location
summary(RuralH$HV201)
summary(SCityH$HV201)
summary(LCityH$HV201)
summary(LTownH$HV201)
summary(MCityH$HV201)
summary(STownH$HV201)

#Analyse non-drinking water source by geographic location
summary(RuralH$HV202)
summary(SCityH$HV202)
summary(LCityH$HV202)
summary(LTownH$HV202)
summary(MCityH$HV202)
summary(STownH$HV202)

#Analyse toilet facilities by geographic location
summary(RuralH$HV205)
summary(SCityH$HV205)
summary(LCityH$HV205)
summary(LTownH$HV205)
summary(MCityH$HV205)
summary(STownH$HV205)

#Analyse household electrification by geographic location
summary(RuralH$HV206)
summary(SCityH$HV206)
summary(LCityH$HV206)
summary(LTownH$HV206)
summary(MCityH$HV206)
summary(STownH$HV206)

#Analyse household possessions

#Radio
summary(RuralH$HV207)
summary(SCityH$HV207)
summary(LCityH$HV207)
summary(LTownH$HV207)
summary(MCityH$HV207)
summary(STownH$HV207)

#Television
summary(RuralH$HV208)
summary(SCityH$HV208)
summary(LCityH$HV208)
summary(LTownH$HV208)
summary(MCityH$HV208)
summary(STownH$HV208)

#Refigerator
summary(RuralH$HV209)
summary(SCityH$HV209)
summary(LCityH$HV209)
summary(LTownH$HV209)
summary(MCityH$HV209)
summary(STownH$HV209)

#Bicycle
summary(RuralH$HV210)
summary(SCityH$HV210)
summary(LCityH$HV210)
summary(LTownH$HV210)
summary(MCityH$HV210)
summary(STownH$HV210)

#Motorcycle
summary(RuralH$HV211)
summary(SCityH$HV211)
summary(LCityH$HV211)
summary(LTownH$HV211)
summary(MCityH$HV211)
summary(STownH$HV211)

#Car
summary(RuralH$HV212)
summary(SCityH$HV212)
summary(LCityH$HV212)
summary(LTownH$HV212)
summary(MCityH$HV212)
summary(STownH$HV212)

#Telephone
summary(RuralH$HV221)
summary(SCityH$HV221)
summary(LCityH$HV221)
summary(LTownH$HV221)
summary(MCityH$HV221)
summary(STownH$HV221)

#Mobile telephone
summary(RuralH$HV243A)
summary(SCityH$HV243A)
summary(LCityH$HV243A)
summary(LTownH$HV243A)
summary(MCityH$HV243A)
summary(STownH$HV243A)

#Watch
summary(RuralH$HV243B)
summary(SCityH$HV243B)
summary(LCityH$HV243B)
summary(LTownH$HV243B)
summary(MCityH$HV243B)
summary(STownH$HV243B)

#Animal drawn cart
summary(RuralH$HV243C)
summary(SCityH$HV243C)
summary(LCityH$HV243C)
summary(LTownH$HV243C)
summary(MCityH$HV243C)
summary(STownH$HV243C)

#Matress
summary(RuralH$SH47B)
summary(SCityH$SH47B)
summary(LCityH$SH47B)
summary(LTownH$SH47B)
summary(MCityH$SH47B)
summary(STownH$SH47B)

#Pressure Cooker
summary(RuralH$SH47C)
summary(SCityH$SH47C)
summary(LCityH$SH47C)
summary(LTownH$SH47C)
summary(MCityH$SH47C)
summary(STownH$SH47C)

#Chair
summary(RuralH$SH47D)
summary(SCityH$SH47D)
summary(LCityH$SH47D)
summary(LTownH$SH47D)
summary(MCityH$SH47D)
summary(STownH$SH47D)

#Cot/bed
summary(RuralH$SH47E)
summary(SCityH$SH47E)
summary(LCityH$SH47E)
summary(LTownH$SH47E)
summary(MCityH$SH47E)
summary(STownH$SH47E)

#Table
summary(RuralH$SH47F)
summary(SCityH$SH47F)
summary(LCityH$SH47F)
summary(LTownH$SH47F)
summary(MCityH$SH47F)
summary(STownH$SH47F)

#Electric fan
summary(RuralH$SH47G)
summary(SCityH$SH47G)
summary(LCityH$SH47G)
summary(LTownH$SH47G)
summary(MCityH$SH47G)
summary(STownH$SH47G)

#B&W Television
summary(RuralH$SH47I)
summary(SCityH$SH47I)
summary(LCityH$SH47I)
summary(LTownH$SH47I)
summary(MCityH$SH47I)
summary(STownH$SH47I)

#Color Television
summary(RuralH$SH47J)
summary(SCityH$SH47J)
summary(LCityH$SH47J)
summary(LTownH$SH47J)
summary(MCityH$SH47J)
summary(STownH$SH47J)

#Sewing Machine
summary(RuralH$SH47K)
summary(SCityH$SH47K)
summary(LCityH$SH47K)
summary(LTownH$SH47K)
summary(MCityH$SH47K)
summary(STownH$SH47K)

#Computer
summary(RuralH$SH47N)
summary(SCityH$SH47N)
summary(LCityH$SH47N)
summary(LTownH$SH47N)
summary(MCityH$SH47N)
summary(STownH$SH47N)

#Water pump
summary(RuralH$SH47U)
summary(SCityH$SH47U)
summary(LCityH$SH47U)
summary(LTownH$SH47U)
summary(MCityH$SH47U)
summary(STownH$SH47U)

#Thresher
summary(RuralH$SH47V)
summary(SCityH$SH47V)
summary(LCityH$SH47V)
summary(LTownH$SH47V)
summary(MCityH$SH47V)
summary(STownH$SH47V)

#Tractor
summary(RuralH$SH47W)
summary(SCityH$SH47W)
summary(LCityH$SH47W)
summary(LTownH$SH47W)
summary(MCityH$SH47W)
summary(STownH$SH47W)

#Type of cooking fuel
summary(RuralH$HV226)
summary(SCityH$HV226)
summary(LCityH$HV226)
summary(LTownH$HV226)
summary(MCityH$HV226)
summary(STownH$HV226)

#Main floor material
summary(RuralH$HV213)
summary(SCityH$HV213)
summary(LCityH$HV213)
summary(LTownH$HV213)
summary(MCityH$HV213)
summary(STownH$HV213)

#Main exterior wall material
summary(RuralH$HV214)
summary(SCityH$HV214)
summary(LCityH$HV214)
summary(LTownH$HV214)
summary(MCityH$HV214)
summary(STownH$HV214)

#Main roof material
summary(RuralH$HV215)
summary(SCityH$HV215)
summary(LCityH$HV215)
summary(LTownH$HV215)
summary(MCityH$HV215)
summary(STownH$HV215)

#Windows
summary(RuralH$SH56A)
summary(SCityH$SH56A)
summary(LCityH$SH56A)
summary(LTownH$SH56A)
summary(MCityH$SH56A)
summary(STownH$SH56A)

#Glass windows
summary(RuralH$SH56B)
summary(SCityH$SH56B)
summary(LCityH$SH56B)
summary(LTownH$SH56B)
summary(MCityH$SH56B)
summary(STownH$SH56B)

#Window screens
summary(RuralH$SH56C)
summary(SCityH$SH56C)
summary(LCityH$SH56C)
summary(LTownH$SH56C)
summary(MCityH$SH56C)
summary(STownH$SH56C)

#Window with curtain or shutters
summary(RuralH$SH56D)
summary(SCityH$SH56D)
summary(LCityH$SH56D)
summary(LTownH$SH56D)
summary(MCityH$SH56D)
summary(STownH$SH56D)

#Number of people sleeping per room
summary(RuralH$HV012/RuralH$HV216)
summary(SCityH$HV012/SCityH$HV216)
summary(LCityH$HV012/LCityH$HV216)
summary(LTownH$HV012/LTownH$HV216)
summary(MCityH$HV012/MCityH$HV216)
summary(STownH$HV012/STownH$HV216)
summary(UrbanH$HV012/UrbanH$HV216)

#House ownership
summary(RuralH$SH58)
summary(SCityH$SH58)
summary(LCityH$SH58)
summary(LTownH$SH58)
summary(MCityH$SH58)
summary(STownH$SH58)

#Household has bank or post office account
summary(RuralH$HV247)
summary(SCityH$HV247)
summary(LCityH$HV247)
summary(LTownH$HV247)
summary(MCityH$HV247)
summary(STownH$HV247)

library(rmarkdown)
library(knitr)




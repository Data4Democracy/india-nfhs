##### Context- The NFHS-3 has created a wealth index which shows how a household
##### is doing economically, when compared to the rest of the country. The index
##### provided (which can be seen on `NFHS3SUP.pdf` in the github repo is a 
##### general index created without taking the geographical location into account.
##### In this project, I'm going to do an Exploratory analysis to see if taking
##### geographic location of the household into consideration will have a 
##### significant change on the index.

household <- read.csv('household_truncated.csv')

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
summary(SCityH$HV202)
summary(LCityH$HV202)
summary(LTownH$HV202)
summary(MCityH$HV202)
summary(STownH$HV202)

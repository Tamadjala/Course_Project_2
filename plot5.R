
#Reading the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltVehiculesub <- vehiclesNEI[vehiclesNEI$fips==24510,]

#plotting using ggplot2
g<- ggplot(baltVehiculesub,aes(factor(year),Emissions)) +
 geom_bar(stat="identity",fill="red") + labs(title=("PM2.5 Vehicle  Emissions in Baltimore from 1999-2008"))+
        labs(x="year", y=("Total PM2.5 Emissions")) 
        

print(g)


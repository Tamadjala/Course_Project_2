#Reading the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subseting from the data the Baltimore dataset
baltsub <- subset(NEI,fips == "24510", c(fips, Emissions, year))

#Calculationg the mean of each year 
baltpm <- with(baltsub, tapply(Emissions, year, mean))
#ploting with barplot function 
barplot(baltpm, 
        col = "blue", main = "Baltimore PM2.5 Emission",
        xlab = "Year", ylab= "PM2.5 Mean")



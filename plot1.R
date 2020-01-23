
#Reading the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Calculation the mean of PM25 of each year and storing them in mean_pm25
mean_pm25 <- with(NEI, tapply(Emissions, year, mean, na.rm = TRUE))
barplot(mean_pm25,
        col = "red", xlab = "Year", ylab = "Mean PM2.5",
        main = "Total PM2.5 Emission in U.S")
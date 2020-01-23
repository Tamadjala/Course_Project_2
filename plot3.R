
#Reading the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot
g <- ggplot(data = baltsub, aes(factor(year), Emissions, fill = type))
g+ geom_bar(stat = "identity") + facet_grid(. ~ type) +
labs(x="year", y=("Total PM2.5] Emission")) + labs(title=("PM2.5 Emissions in Baltimore City (1999-2008)"))
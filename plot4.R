#Reading the dataset
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subseting  coal combustion related data
combus <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_related <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coal_combus <- (combus & coal_related)
combus_ssc <- SCC[coal_combus,]$SCC
combus_NEI <- NEI[NEI$SCC %in% combus_ssc,]

#ploting the graph
g <- ggplot(combus_NEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="red") +
         labs(x="Year", y=expression("Total PM2.5 Emission")) + 
        labs(title=expression("PM2.5 Coal Combustion Source Emissions in US from 1999-2008"))

print(g)
install.packages("devtools")
install_github("weatherData", "Ram-N")
library("devtools")
library(weatherData)
library(ggplot2)

city1 <- "DFW"

city2 <- "NYC"

df1 <- getWeatherForYear(city1, 2016)

df2 <- getWeatherForYear(city2, 2016)

df1
df2

getDailyDifferences <- function(df1, df2){
  Delta_Means <- df1$Mean_TemperatureF - df2$Mean_TemperatureF
  Delta_Max <- df1$Max_TemperatureF - df2$Max_TemperatureF
  Delta_Min <- df1$Min_TemperatureF - df2$Min_TemperatureF
  
  diff_df <- data.frame(Date=df1$Date, Delta_Means, Delta_Max, Delta_Min)
  return(diff_df)
}

differences<- getDailyDifferences(df1, df2)


plotDifferences <- function (differences, city1, city2) {
  library(reshape2)
  m.diff <- melt(differences, id.vars=c("Date"))
  p <- ggplot(m.diff, aes(x=Date, y=value)) + geom_point(aes(color=variable)) +  
    facet_grid(variable ~ .) +geom_hline(yintercept=0)
  p <- p + labs(title=paste0("Daily Temperature Differences: ", city1, " minus ",city2))
  print(p)
}

plotDifferences(differences, city1, city2)

# weatherDataAPI
This functions that help in fetching weather data from websites
The main purpose of this function is to perform weather Analysis , but do not wish to do data scraping 
Given a location and a date range, these functions help fetch weather data (temperature, pressure etc.) for any weather related analysis.
This particular API gets the data from
         https://www.wunderground.com/

# getWeatherForYear() Function
This function helps to compare the daily temperature differences for two cities. In this example, we get one year's worth of data for two cities, and plot the daily differences.
How to get started ?
The latest version of weatherData is on Github. Install and load the packages as below 

# Install Package from github
install.packages("devtools")
library("devtools")
install_github("weatherData", "Ram-N")

# Load the library

library(weatherData)
library(ggplot2)

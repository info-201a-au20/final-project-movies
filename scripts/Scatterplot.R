# Load packages 
library(dplyr)
library(ggplot2)
library(plotly)

# Creating a scatterplot of different movie genres and corresponding average
# votes over the years
get_scatterplot <- function(dataframe) {
  # TO-DO: split genre column's strings by commas, calculate average vote
  # for each genre per year
  
  scatterplot <- ggplot(data = dataframe) +
    geom_point(mapping = aes(x = year, y = avg_vote, color = genre)) +
    ggtitle("Average Vote of Movie Genres by Year (1990 - 2020)") + 
    xlab("Year") +
    ylab("Average vote (out of 10)")
  
  return(scatterplot)
}


# Load packages
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)
library(tidyr)
library(lintr)
library(stringr)

# Creating a scatterplot of different movie genres and corresponding average
# votes over the years
get_scatterplot <- function(dataframe) {
  # Manipulate the dataframe to have the distinct movie genres and average vote
  # per genre for each year
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)
  
  scatterplot <- ggplot(data = data) +
    geom_point(mapping = aes(x = year, y = genre_avg_vote, color = genre)) +
    ggtitle("Average Vote of Movie Genres by Year") +
    xlab("Year") +
    ylab("Average vote (out of 10)")
  
  return(scatterplot)
}

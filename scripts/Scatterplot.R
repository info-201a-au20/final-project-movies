# Load packages
library(dplyr)
library(ggplot2)
library(tidyr)
library(lintr)
library(stringr)

# Function that accepts a dataframe and returns a scatterplot of different movie
# genres and corresponding average votes over the years based on data from that
# dataframe
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
    ggtitle("Average Vote of Movie Genres by Year (1990 - 2020)") +
    xlab("Year") +
    ylab("Average vote (out of 10)")

  return(scatterplot)
}

# IDEA: CREATE NEW FUNCTION AND RETURN EDITED DATAFRAME (then pass to ui)
change_df <- function(dataframe) {
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)
  
  return(data)
}

# Function that accepts a dataframe and genre and builds a scatterplot of the 
# genre's corresponding average votes over the years based on dataframe's data
build_scatterplot <- function(dataframe, genre_input) { 
  #print(genre_input)
  
  # Manipulate the dataframe
  data <- dataframe %>%
    select(genre, avg_vote, year) %>%
    separate_rows(genre, sep = ", ") %>%
    group_by(genre, year) %>%
    #filter(genre == genre_input) %>% # filter dataframe based on inputted genre
    filter(genre %in% genre_input) %>%
    mutate("genre_avg_vote" = sum(avg_vote, na.rm = TRUE) / n()) %>%
    group_by(year)
  
  scatterplot <- ggplot(data = data) +
    #geom_point(mapping = aes(x = year, y = genre_avg_vote)) +
    geom_point(mapping = aes(x = year, y = genre_avg_vote, color = genre)) +
    ggtitle(paste0("Average Vote of ", genre_input, " Genre(s) by Year (1990 - 2020)")) +
    xlab("Year") +
    ylab("Average vote (out of 10)")
  
  return(scatterplot)
}

# Testing build_scatterplot function
#df <- read.csv("./data/midpoint_df.csv", stringsAsFactors = FALSE)
#build_scatterplot(df, "Action")

#data <- change_df(df)
